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
  static UserInfo user(){
    return UserInfo._user;
  }

  //将用户信息保存在内存中
  static saveUser(Map info){
    String userid = (info["UserId"] ?? "") as String;
    String username = (info["UserName"] ?? "") as String;
    String avatar = (info["Avatar"] ?? "") as String;
    String telephone = (info["TelePhone"] ?? "") as String;
    String mobilephone = (info["MobilePhone"] ?? "") as String;
    String email = (info["Email"] ?? "") as String;
    UserInfo user = UserInfo(username: username,userid: userid,avatar: avatar,telephone: telephone,mobilephone: mobilephone,email: email);
    UserInfo._user = user;
    //将用户信息保存到缓存中
    String infoStr = DataConvert.jsonToString(info);
    LocalCache.saveStringValueForKey(key: USERINFO_KEY, value: infoStr);
  }

  UserInfo({required this.username,required this.userid,required this.avatar,required this.telephone,required this.mobilephone,required this.email});


}