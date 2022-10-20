import 'dart:async';
import 'dart:collection';
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zw/utils/logs_util.dart';
import 'package:zw/utils/event_bus_util.dart';
/// @descriptions: 请求工具
/// version: 1.0.0
///
typedef void DioRequestErrorCallBack(DioError error); //网络请求异常回调

class TokenInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    /// 在发送请求之前做一些预处理
    final SharedPreferences prefs = await DioUtil.getPrefs();
    var userticket = prefs.getString('userticket');
    options.headers['Content-Type'] = 'application/json;charset=UTF-8';
    ///获取用户的身份信息
    options.headers["Content-Encoding"] = "gzip";
    options.headers['User-Ticket'] = userticket;
    options.headers['Device-id'] = prefs.getString('Device-Id');
    options.headers['grayid'] = '';
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  onError(DioError error, ErrorInterceptorHandler handler) async {
    super.onError(error, handler);
  }
}

class JWTTokenInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    /// 在发送请求之前做一些预处理
    options.headers['Content-Type'] = 'application/json;charset=UTF-8';
    options.headers['Authorization'] ="Bearer ";

    log("JWTToken接口Url === ${options.baseUrl + options.path} \n 请求参数 = ${convert.jsonEncode(options.data)}");

    log("JWTToken接口Headers === ${options.headers}");

    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  onError(DioError error, ErrorInterceptorHandler handler) async {
    super.onError(error, handler);
  }
}

class DioUtil {
  late Dio dio;
  static Map<String,CancelToken> cancelTokenCache = {};
  static late DioUtil _instance;
  static final Map<String, int> urlMap = {};
  static final int max = 2;

  // 是否jws 正在刷新
  static bool jws_is_fresh = false;

  static late SharedPreferences _prefs;

  /// 获取dio实例
  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }

  static Future<SharedPreferences> getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  /// 请求部分
  Future request(String url,
      {required String serviceUrl, data, method, requestType,bool needCancel=false}) async {
    LogsUtil.i("superapp request", "url:${url},data:${data},method:${method},requestType:${requestType}");

    BaseOptions options = new BaseOptions(
        baseUrl: serviceUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        responseType: ResponseType.bytes,
        headers: {},
        method: method);
    dio = new Dio(options);
      /// 添加自定义的token拦截器
      dio.interceptors.add(new TokenInterceptor());

    // 重新获取userTicket,重新请求
    try {
      Response response;
      if(needCancel){
        CancelToken cancelToken = CancelToken();
        cancelTokenCache[url] = cancelToken;
        response = await dio.request(url, data: data,cancelToken: cancelToken);
      }else{
        response = await dio.request(url, data: data);
      }

      if(needCancel){
        //当缓存了取消token，请求成功之后进行移除
        cancelTokenCache.remove(url);
      }
      if (response.statusCode == 200 && response.data != null) {
        var number = urlMap[url];
        if (number != null) {
          //如果刷新过JWS，计数器回滚。
          urlMap[url] = 0;
        }
        //返回数据
        String source = utf8.decode(response.data);
        return jsonDecode(source);
      } else {
        if (response.statusCode == 608) {
          EventBus().emit(EventBusMap.OVERSEAS_USER);
        }
        return null;
      }
    } on DioError catch (e) {
      if(needCancel){
        //请求失败报错时，当缓存了取消token，请求成功之后进行移除
        cancelTokenCache.remove(url);
      }
      // EcHud.dismissLoadig();
      var errorResponse;
      if (e.response != null) {
        LogsUtil.e("DioError",
            "请求${url}发生DioError错误:${e.response?.statusCode},data:${e.requestOptions.data},header 如下");
        e.response?.requestOptions.headers.forEach((key, value) {
          LogsUtil.e("${key}:", value);
        });

        errorResponse = e.response;
        if (errorResponse.statusCode == 608) {
          EventBus().emit(EventBusMap.OVERSEAS_USER);
        }
        if (method == "post" &&
            requestType != "msg" &&
            (errorResponse.statusCode == 401 ||
                errorResponse.statusCode == 406)) {
          if (!jws_is_fresh) {
            LogsUtil.i("jws没有正在刷新", "start");

            /// abo 接口
            if (url.contains("abo?loginTime=")) {
              LogsUtil.i("jws没有刷新", "abo接口");
              var number = urlMap[url];
              if (number == null) {
                number = 0;
                urlMap[url] = number;
              }
              if (number < max) {
                jws_is_fresh = true;
                number += 1;
                urlMap[url] = number;
                LogsUtil.i("进行doFreshAndRequest", "abo接口");

                int res = await doFreshAndRequest(url: url);
                if (res == 0) {
                  return request(url,
                      serviceUrl: serviceUrl,
                      data: data,
                      method: method,
                      requestType: requestType);
                } else {
                  LogsUtil.i("刷新token", "失败，未重新请求");
                  // to be done, 加重试（先不需要）
                  return null;
                }
              } else {
                LogsUtil.i("${url}持续401", "直接返回null");
                //urlMap.remove(url); 这里不需要移除，后续都不请求了
                EventBus().emit("logout_restart");
                //ToastUtils.showShortToast("${url}持续401，请联系我们");
                return null;
              }
            }

            /// 如果不是abo接口
            else {
              var number = urlMap[url];
              if (number == null) {
                number = 0;
                urlMap[url] = number;
              }
              if (number < max) {
                number += 1;
                urlMap[url] = number;

                LogsUtil.i("EventBusMap.NEED_RELOGIN", "事件发出");

                //有了缓存机制，可以自己刷新
                /// 通过abo 刷新情况下，只有abo 接口才能加锁
                jws_is_fresh = true;

                int res = await doFreshAndRequest(url: url);
                if (res == 0) {
                  return request(url,
                      serviceUrl: serviceUrl,
                      data: data,
                      method: method,
                      requestType: requestType);
                }
              } else {
                //ToastUtils.showShortToast("${url}持续401，请联系我们");
                EventBus().emit("logout_restart");
                LogsUtil.i("EventBusMap.NEED_RELOGIN", "${url}持续${e.error}，");
                return null;
              }
            }
          }

          /// 已经在刷新了
          else {
            LogsUtil.i("已经在刷新了", "延迟1s");
            await Future.delayed(Duration(milliseconds: 1000), () {
              return true;
            });
            return null;
          }
        } else {
          if (e.response?.data is List) {
            LogsUtil.e('请求结果包含错误',
                'url:$url;data:${data.toString()};error:${utf8.decode(e.response?.data)}');
          }
          return null;
        }
      } else {
        LogsUtil.e('请求发生错误', 'url:$url;data:${data.toString()};error:$e');
        return null;
      }
    } catch (ee) {
      LogsUtil.e('请求发生错误', ee);
      //LogsUtil.uploadLogs("请求发生错误", "非DIO异常${url}:${convert.jsonEncode(ee)}");
      return null;
    }
    return null;
  }

  Future<int> doFreshAndRequest({String? url}) async {
    LogsUtil.i("jwtTokenRefresh", "start refresh");
    try {
      /// 如果权限验证失败 则重新进行网络请求 , 此处先排除 自身请求的情况，避免调用循环
      /// 通过后端确认，刷新token后，不会出现401情况，去除
      /// HashMap<String, String> arguments = new HashMap<>();
      //             arguments.put("channel", javaScriptChannelName);
      // var resultJson = await loginChannel.invokeMethod('jwtTokenRefresh');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // String resultJson = await loginChannel.invokeMethod(loginChannelIsLogin);
      // if (resultJson == null || resultJson.isEmpty) {
      //   //如果jws为空时  不重新获取jwsToken
      //   jws_is_fresh = false;
      //
      //   return 1;
      // }
      // final HashMap<String, String> arguments = HashMap<String, String>();

      // var refreshInfo =await loginChannel.invokeMethod('jwsTokenRefresh', arguments);
      // final Map<String, dynamic> resultMap = convert.jsonDecode(refreshInfo);
      // LogsUtil.i("Refresh", refreshInfo);

      // if (resultMap["errcode"] == "0") {
      //   LogsUtil.i("Refresh ", "success");
      //
      //   /// 存储jws 获取时间
      //   await prefs.setInt("jwsBegin", DateTime.now().millisecondsSinceEpoch);
      //   jws_is_fresh = false;
      //   return 0;
      // } else {
      //   //如果本地没有最后登录的时间, 不登录, 否则去登录
      //   if (prefs.get("localLoginTime") == null) return 1;
      //   LogsUtil.i("Refresh ", "fail---");
      //
      //   EventBus().emit(EventBusMap.LOGOUT);
      //   jws_is_fresh = false;
      //   return 1;
      // }
    } catch (e) {
      LogsUtil.e("刷新token失败", e);
      jws_is_fresh = false;
    }
    // 表示失败
    return 1;
  }

  void cancelRequest({required String cancelKey}) {
    if(cancelKey == null || cancelKey.length ==0){
      return;
    }
    var cancelToken = cancelTokenCache[cancelKey];
    if (cancelToken != null) {
      cancelToken.cancel("取消网络请求");
      cancelTokenCache.remove(cancelKey);
    }
  }
}
