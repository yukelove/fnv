import 'dart:convert' as convert;
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:zw_/utils/log_utils.dart';

///http请求成功回调
typedef HttpSuccessCallback<T> = void Function(dynamic data);

///失败回调
typedef HttpFailureCallback = void Function(String data);

///数据解析回调
typedef T JsonParse<T>(dynamic data);

class NetworkingManager {
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  ///超时时间
  static const int CONNECT_TIMEOUT = 100000;
  static const int RECEIVE_TIMEOUT = 100000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String DELETE = 'delete';

  Dio? _client;

  static NetworkingManager _instance = NetworkingManager._initialize();

  Dio? get client => _client;

  static NetworkingManager shared() {
    return _instance;
  }

  factory NetworkingManager() {
    return _instance;
  }

  /// 创建 dio 实例对象
  NetworkingManager._initialize(){
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      responseType: ResponseType.bytes,
    );
    _client = Dio(options);
    //增加请求日志打印
    _client!.interceptors..add(LogInterceptor());
  }

  NetworkingManager.init(
      {required String baseUrl,
      required int connectTimeout,
      required int receiveTimeout,
      List<Interceptor>? interceptors}) {
    _client?.options = _instance._client!.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _client!.interceptors..addAll(interceptors);
    }
  }

  ///取消网络请求
  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag]!.isCancelled) {
        _cancelTokens[tag]?.cancel();
      }
      _cancelTokens.remove(tag);
    }
  }

  ///restful处理
  String _restfulUrl(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }

  void getRequest({
    required String url,
    String? tag,
    required Map<String, dynamic> params,
    bool isCache = false,
    bool isLoading = false,
    bool isShowTip = false,
    Options? options,
    required HttpSuccessCallback successCallback,
    required HttpFailureCallback errorCallback,
  }) async {
    _request(
      url: url,
      params: params,
      tag: tag,
      method: GET,
      options: options,
      successCallback: successCallback,
      errorCallback: errorCallback,
    );
  }

  void postRequest({
    required String url,
    Map? data,
    required Map<String, dynamic> params,
    Options? options,
    required HttpSuccessCallback successCallback,
    required HttpFailureCallback errorCallback,
    String? tag,
  }) async {
    _request(
      url: url,
      data: data,
      params: params,
      tag: tag,
      method: POST,
      options: options,
      successCallback: successCallback,
      errorCallback: errorCallback,
    );
  }

  Future<dynamic> getAsync<T>({
    required String url,
    required Map<String, dynamic> params,
    Options? options,
    JsonParse<T>? jsonParse,
    String? tag,
  }) async {
    return _requestAsync(
      url: url,
      data: params,
      method: GET,
      params: params,
      options: options,
      jsonParse: jsonParse,
      tag: tag,
    );
  }

  Future<dynamic> postAsync<T>({
    required String url,
    required Map data,
    Map<String, dynamic>? params,
    Options? options,
    JsonParse<T>? jsonParse,
    String? tag,
    bool rawData = false,
  }) async {
    return _requestAsync(
      url: url,
      method: POST,
      data: data,
      params: params,
      rawData: rawData,
      tag: tag,
    );
  }

  void _request({
    required String url,
    String method = "post",
    String? tag,
    Map? data,
    Options? options,
    Map<String, dynamic>? params,
    required HttpSuccessCallback successCallback,
    required HttpFailureCallback errorCallback,
  }) async {
    if (method.toLowerCase() == "post") {}
    //设置默认值
    params = params ?? {};
    options?.method = method;

    options = options ?? Options(method: method);

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken = null;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag]!;
        _cancelTokens[tag] = cancelToken;
      }

      Response<dynamic> response = await _client!.request(url,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);
      Map<String, dynamic> jsonMap =
          convert.jsonDecode(convert.utf8.decode(response.data as List<int>))
              as Map<String, dynamic>;
      var statusCode = jsonMap["code"];
      if (statusCode == "success" ||
          statusCode == 0 ||
          statusCode == "0" ||
          statusCode == 200 ||
          statusCode == "200") {
        successCallback(jsonMap);
      } else {
        errorCallback("");
      }
    } on DioError catch (e, s) {
    } catch (e, s) {}
  }

  Future _requestAsync<T>({
    required String url,
    String? method,
    required Map data,
    Map<String, dynamic>? params,
    Options? options,
    JsonParse<T>? jsonParse,
    String? tag,
    bool rawData = false,
  }) async {
    //设置默认值
    params = params ?? {};
    method = method ?? 'GET';

    options?.method = method;

    options = options ?? Options(method: method);

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken = null;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag]!;
        _cancelTokens[tag] = cancelToken;
      }

      Map requestMap = data;
      Response<dynamic> response = await _client!.request(url,
          queryParameters: params,
          data: requestMap,
          options: options,
          cancelToken: cancelToken);

      Map<String, dynamic> jsonMap =
          convert.jsonDecode(convert.utf8.decode(response.data as List<int>))
              as Map<String, dynamic>;
      var statusCode = jsonMap["code"];
      if (statusCode == "success" ||
          statusCode == 0 ||
          statusCode == "0" ||
          statusCode == 200 ||
          statusCode == '200') {
        if (jsonParse != null) {
          return jsonParse(jsonMap["data"]);
        } else {
          return jsonMap["data"];
        }
      } else {
        return jsonMap;
      }
    } on DioError catch (e) {
      ZWLogUtil.d("请求结果为 ${e}");
    } catch (e, s) {
      print("请求结果为");
      ZWLogUtil.d("请求结果为 ${e} ${s}");
    }
  }
}
