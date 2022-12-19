import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zw_/utils/log_utils.dart';
import 'dart:convert' as convert;

///Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  static List<Map> sHttpResponses = [];
  static List<String> sResponsesHttpUrl = [];

  static List<Map<String, dynamic>> sHttpRequest = [];
  static List<String> sRequestHttpUrl = [];

  static List<Map<String, dynamic>> sHttpError = [];
  static List<String> sHttpErrorUrl = [];

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      addLogic(sRequestHttpUrl, options.path);
      var data;
      if (options.data is Map) {
        data = options.data;
      } else {
        data = Map<String, dynamic>();
      }
      var map = {
        "header:": {...options.headers},
      };
      if (options.method == "POST") {
        map["data"] = data as Map<String,dynamic>;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      // print(e);
    }
    DateTime startDateTime = DateTime.now();
    ZWLogUtil.d(
        "请求url--> + ${options.path.toString()}\n开始时间 == ${startDateTime.second}秒${startDateTime.millisecond}");
    ZWLogUtil.d("请求参数->" + json.encode(options.data).toString());
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    // ignore: unnecessary_null_comparison
    if (response != null) {
      DateTime endDateTime = DateTime.now();
      if (response.data != null) {
        Map<String,dynamic> jsonMap =
            convert.jsonDecode(convert.utf8.decode(response.data as List<int>)) as Map<String,dynamic>;
        var statusCode = jsonMap["code"];
        if (statusCode == "success" ||
            statusCode == 0 ||
            statusCode == "0" ||
            statusCode == "200") {
          Map resultMap = convert.jsonDecode(convert.utf8.decode(response.data as List<int >)) as Map<String,dynamic>;
          ZWLogUtil.d(
              "请求url-->返回数据${response.requestOptions.path.toString()}\n结束时间->${endDateTime.second}秒${endDateTime.millisecond}\n${json.encode(resultMap).toString()}");
        } else {
          ZWLogUtil.d(
              "请求url-->接口报错了${response.requestOptions.path.toString()}\n结束时间->${endDateTime.second}秒${endDateTime.millisecond}\n返回参数->${jsonDecode(convert.utf8.decode(response.data as List<int>))}");
        }
      } else {
        Map resultMap = convert.jsonDecode(convert.utf8.decode(response.data as List<int >)) as Map<String,dynamic>;
        ZWLogUtil.d(
            "请求url-->返回数据${response.requestOptions.path.toString()}\n结束时间->${endDateTime.second}秒${endDateTime.millisecond}\n${json.encode(resultMap).toString()}}");
      }
    }
    if (response.data is Map || response.data is List) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(
            sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, data);
      } catch (e) {}
    } else if (response.data is String) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(
            sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, data);
      } catch (e) {}
    } else if (response.data != null) {
      try {
        String data = response.data.toJson() as String;
        addLogic(
            sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, json.decode(data));
      } catch (e) {}
    }
    return handler.next(response); // continue
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {

    try {
      addLogic(sHttpErrorUrl, err.requestOptions.path);
      var errors = Map<String, dynamic>();
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      // print(e);
    }
    return handler.next(err); // continue;
  }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }
}
