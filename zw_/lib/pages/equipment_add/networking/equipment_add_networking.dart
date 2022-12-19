import 'package:zw_/api/api.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';

class EquipmentAddNetworking {
  static Future<bool> addEquipment({required String equipmentCode}) async {
    UserInfo user = UserInfo.user();
    ZWLogUtil.d("userid"+user.userid);
    ZWLogUtil.d("equipmentCode="+equipmentCode);
    var param = {
      "serialnumber": equipmentCode,
      "userId": user.userid,
      "optype": "A",
      "token":"17312344325"
    };
    ZWHud.showLoading(S.current.toast_requesting);
    var result = await NetworkingManager.shared()
        .postAsync(url: Api.Equipment_ADD, data: param);
    if (result != null) {
      var code = result["code"];
      var msg  = result["msg"];
      if (code!=null && code.toString()=="1") {
        ZWHud.showText(S.current.add_device_success);
        return true;
      } else {
        ZWHud.showText(S.current.add_device_fail + "  "+msg.toString());
        return false;
      }
    } else {
      ZWHud.showText(S.current.add_device_fail);
      return false;
    }
  }
}
