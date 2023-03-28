import 'package:zw_/api/api.dart';
import 'package:zw_/constant/constant_declare.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/local_cache.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';


class UserNetworking {
  static Future<bool> timeConfigSave(
      {required String mobilePhone, required String email, required String password, String? inviteCode}) async {
    // {"userid":"","username":"测试2","email":"12345@qq.com","mobilephone":"17312344325","password":"123456","invitecode":"","language":"CN"}
    if (mobilePhone.isEmpty || email.isEmpty || password.isEmpty) {
      ZWHud.showText(S.current.mobilephone_password_need);
      return false;
    }

    ZWHud.showLoading(S.current.toast_requesting);
    var param = {
      "userid": "",
      "username": "",
      "mobilephone": mobilePhone,
      "email": email,
      "password": password,
      "invitecode": inviteCode,
      "language": "CN"
    };
    var result = await NetworkingManager.shared().postAsync(
        url: Api.User_Register, data: param);
    var code = result["code"];
    var msg = result["msg"];
    if (code == -1) {
      ZWHud.showText(msg.toString());
      return false;
    } else {
      ZWHud.showText(S.current.register_success);
      return true;
    }
  }

  static Future<bool> timeConfigQuery(
      {required String emailOrMobilePhone, required String password}) async {
    ZWHud.showLoading(S.current.toast_requesting);
    var param = {
      "email": emailOrMobilePhone,
      "password": password,
      "language": "CN"
    };
    var result = await NetworkingManager.shared()
        .postAsync(url: Api.DO_LOGIN, data: param);
    ZWLogUtil.d("login info === ${result}");
    if (result is Map) {
      var code = result['code'];
      var msg = result['msg'];
      if (null != code &&
          code
              .toString()
              .isNotEmpty &&
          code.toString().compareTo("1") > -1) {
        var userInfo = result["data"];
        if (userInfo is Map) {
          Map map = userInfo as Map;
          UserInfo.saveUser(map);
        }
        //保存登录凭证
        var token = (result['token'] ?? "") as String;
        UserInfo.token = token;
        LocalCache.saveStringValueForKey(key: USERTOKEN_KEY, value: token);
        return true;
      } else {
        if (null != msg) {
          ZWHud.showText(msg.toString());
        } else {
          ZWHud.showText("登录失败");
        }
        return false;
      }
    } else {
      ZWHud.showText("登录失败");
      return false;
    }
  }
}
