import 'package:zw_/api/api.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';

class UserNetworking {
  static Future<bool> userRegister({required String mobilePhone,required String email,required String password,String? inviteCode}) async{
    // {"userid":"","username":"测试2","email":"12345@qq.com","mobilephone":"17312344325","password":"123456","invitecode":"","language":"CN"}
    ZWHud.showLoading("请求中...");
    var param = {"userid":"","username":"测试2","email":email,"password":password,"invitecode":"","language":"CN"};
    var result = await NetworkingManager.shared().postAsync(url: Api.User_Register, data: param);
    var code = result["code"];
    if(code == -1){
      ZWHud.showText("账号已注册");
      return false;
    }else{
      ZWHud.showText("账号注册成功！");
      return true;
    }
  }

  static Future<bool> userLogin({required String emailOrMobilePhone,required String password}) async{
    ZWHud.showLoading("请求中...");
    var param = {"email":emailOrMobilePhone,"password":password,"language":"CN"};
    var result = await NetworkingManager.shared().postAsync(url: Api.DO_LOGIN, data: param);
    ZWLogUtil.d("登录信息 === ${result}");
    return false;
  }
}