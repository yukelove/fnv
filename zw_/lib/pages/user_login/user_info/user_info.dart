import 'package:zw_/constant/constant_declare.dart';
import 'package:zw_/utils/data_convert.dart';
import 'package:zw_/utils/local_cache.dart';

class UserInfo {
  String userid = "";
  String username = "";
  String avatar = "";
  String telephone = "";
  String mobilephone = "";
  String email = "";
  static late UserInfo _user;
  static String token = ""; // 请求凭证
  static UserInfo user() {
    return UserInfo._user;
  }

  //将用户信息保存在内存中
  static saveUser(Map info) {
    // String userid = (info["UserId"] ?? "") as String;
    // String username = (info["UserName"] ?? "") as String;
    // String avatar = (info["Avatar"] ?? "") as String;
    // String telephone = (info["TelePhone"] ?? "") as String;
    // String mobilephone = (info["MobilePhone"] ?? "") as String;
    // String email = (info["Email"] ?? "") as String;
    UserInfo user = UserInfo.fromJson(
        info); //UserInfo(username: username,userid: userid,avatar: avatar,telephone: telephone,mobilephone: mobilephone,email: email);
    UserInfo._user = user;
    //将用户信息保存到缓存中
    String infoStr = DataConvert.jsonToString(info);
    LocalCache.saveStringValueForKey(key: USERINFO_KEY, value: infoStr);
  }

  //获取用户信息
  static Future<UserInfo> getUserInfo() async {
    if (UserInfo._user != Null) {
      return UserInfo._user;
    } else {
      var userInfoString =
          await LocalCache.getStringValueForKey(key: USERINFO_KEY);
      var userInfoJson = DataConvert.stringToJson(userInfoString);
      UserInfo user = UserInfo.fromJson(userInfoJson);
      UserInfo._user = user;
    }
    return UserInfo._user;
  }

  UserInfo(
      {required this.username,
      required this.userid,
      required this.avatar,
      required this.telephone,
      required this.mobilephone,
      required this.email});

  static UserInfo fromJson(Map json) {
    String userid = (json["UserId"] ?? "") as String;
    String username = (json["UserName"] ?? "") as String;
    String avatar = (json["Avatar"] ?? "") as String;
    String telephone = (json["TelePhone"] ?? "") as String;
    String mobilephone = (json["MobilePhone"] ?? "") as String;
    String email = (json["Email"] ?? "") as String;
    UserInfo user = UserInfo(
        username: username,
        userid: userid,
        avatar: avatar,
        telephone: telephone,
        mobilephone: mobilephone,
        email: email);
    return user;
  }
}
