
import 'package:zw_/pages/model/Data.dart';

class UploadIconResult {
  UploadIconResult({
    required this.code,
    required this.message,
    required this.userId,
    required this.data,
  });

  String code;
  String message;
  String userId;
  Data data;

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": message,
    "userId": userId,
    "data": data.toJson(),
  };

  static UploadIconResult fromJson(Map map) {
    String code =  (map["code"] ?? "") as String;
    String message = (map["message"] ?? "") as String;
    String userId = (map["userId"] ?? "") as String;
    Data data = (map["data"] ?? "") as Data;

    return UploadIconResult(
      code:code,
      message: message,
      userId: userId,
      data: data,
    );

  }


  static UploadIconResult uploadIconData(Map map){
    String code =  (map["code"] ?? "") as String;
    String message = (map["message"] ?? "") as String;
    String userId = (map["userId"] ?? "") as String;
    Map dataStr  = (map["data"] ?? "") as Map;

    Data data = Data.fromJson(dataStr) ;

    return UploadIconResult(
      code:code,
      message: message,
      userId: userId,
      data: data,
    );
  }

}
