import 'package:zw_/api/api.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';

class UserNetworking {
  static Future<bool> userRegister({required String mobilePhone,required String email,required String password,String? inviteCode}) async{
    // {"userid":"","username":"测试2","email":"12345@qq.com","mobilephone":"17312344325","password":"123456","invitecode":"","language":"CN"}
    if(mobilePhone.isEmpty || email.isEmpty || password.isEmpty){
      ZWHud.showText(S.current.mobilephone_password_need);
      return false;
    }

    ZWHud.showLoading(S.current.toast_requesting);
    var param = {"userid":"","username":"","mobilephone":mobilePhone,"email":email,"password":password,"invitecode":inviteCode,"language":"CN"};
    var result = await NetworkingManager.shared().postAsync(url: Api.User_Register, data: param);
    var code = result["code"];
    var msg = result["msg"];
    if(code == -1){
      ZWHud.showText(msg.toString());
      return false;
    }else{
      ZWHud.showText(S.current.register_success);
      return true;
    }
  }

  static Future<bool> userLogin({required String emailOrMobilePhone,required String password}) async{
    ZWHud.showLoading(S.current.toast_requesting);
    var param = {"email":emailOrMobilePhone,"password":password,"language":"CN"};
    var result = await NetworkingManager.shared().postAsync(url: Api.DO_LOGIN, data: param);
    ZWLogUtil.d("login info === ${result}");
    var code = result['code'];
    var msg = result['msg'];
    if(null != code && code.toString().isNotEmpty && code.toString().compareTo("1")>-1 ){
      return true;
    }else {
      if(null != msg){
        ZWHud.showText(msg.toString());
      }
      return false;
    }
  }

  static Future<bool> getValidateCode({required String mobilePhone, required String email}) async {
    ZWHud.showLoading(S.current.toast_requesting);
    var param = {"mobilePhone":mobilePhone,"email":email};
    try {
      var result = await NetworkingManager.shared().postAsync(
          url: Api.GET_VALIDATE_CODE, data: param);
      var code = result['code'];
      var msg = result['msg'];
      if (null != code && code
          .toString()
          .isNotEmpty && code.toString().compareTo("1") > -1) {
        return true;
      } else {
        if (null != msg) {
          ZWHud.showText(msg.toString());
        }
        return false;
      }
    }catch(e){
      ZWHud.showText(e.toString());
    return false;
    }finally{
    }
  }

  static Future<bool> retrievePassword({required String mobilePhone, required String email, required String validateCode, required String password}) async{
    ZWHud.showLoading(S.current.toast_requesting);
    var param = {"mobilePhone":mobilePhone,"email":email};
    try {
      var result = await NetworkingManager.shared().postAsync(
          url: Api.RETRIEVE_PASSWORD, data: param);
      var code = result['code'];
      var msg = result['msg'];
      if (null != code && code
          .toString()
          .isNotEmpty && code.toString().compareTo("1") > -1) {
        return true;
      } else {
        if (null != msg) {
          ZWHud.showText(msg.toString());
        }
        return false;
      }
    }catch(e){
      ZWHud.showText(e.toString());
      return false;
    }finally{
    }
  }
}