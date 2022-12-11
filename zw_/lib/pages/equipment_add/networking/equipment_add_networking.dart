import 'package:zw_/api/api.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/zw_hud.dart';

class EquipmentAddNetworking {
  static Future<bool> addEquipment({required String equipmentCode}) async {
    UserInfo user = UserInfo.user();
    var param = {
      "serialnumber": equipmentCode,
      "userId": user.userid,
      "optype": "A"
    };
    ZWHud.showLoading("请求中...");
    var result = await NetworkingManager.shared()
        .postAsync(url: Api.Equipment_ADD, data: param);
    if (result != null) {
      var code = result["code"];
      if (code == "1") {
        ZWHud.showText("设备添加成功!");
        return true;
      } else {
        ZWHud.showText("设备添加失败，请重新扫描二维码!");
        return false;
      }
    } else {
      ZWHud.showText("设备添加失败，请重新扫描二维码!");
      return false;
    }
  }
}
