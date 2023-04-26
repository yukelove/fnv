import 'package:zw_/api/api.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/log_utils.dart';
import '../../equipment_list/state/equipment_model.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/generated/l10n.dart';

class EquipmentDetailNetworking {
  //获取设备信息
  static Future<Map> equipmentInfo(String serialnumber) async{
    UserInfo user = await UserInfo.getUserInfo();
    var param = {"userid":user.userid,"token":UserInfo.token,"serialnumber":serialnumber};
    var result = await NetworkingManager.shared().postAsync(
          url: Api.Equipment_DETAIL, data: param);
          ZWLogUtil.d(result);
    Map map = (result["data"][0] ?? {}) as Map;
    ZWLogUtil.d(map);
          ZWLogUtil.d(result);
    return map;
  }

   //获取设备编辑信息
  static Future<Map> equipmentEditInfo(String serialnumber) async{
    UserInfo user = await UserInfo.getUserInfo();
    var param = {"userid":user.userid,"token":UserInfo.token,"serialnumber":serialnumber};
    var result = await NetworkingManager.shared().postAsync(
          url: Api.Equipment_DETAIL, data: param);
          ZWLogUtil.d(result);
    Map map = (result["data"][0] ?? {}) as Map;
    ZWLogUtil.d(map);
          ZWLogUtil.d(result);
    return map;
  }

  //修改设备信息
  static Future<bool> editEquipmentInfo(EquipmentModel model) async{
    bool re = validateProperties(model);
    if(re) {
      var param = model.toJson();
      var result = await NetworkingManager.shared().postAsync(
          url: Api.Equipment_EDIT_INFO, data: param);
      var code = result["code"];
      var msg = result["msg"];
      if (code == -1) {
        ZWHud.showText(msg.toString());
        return false;
      } else {
        return true;
      }
    }else{
      return false;
    }
  }

  static bool validateProperties(EquipmentModel model) {
    if(model.serialnumber.isEmpty || model.devicename.isEmpty){
      return false;
    }else{
      return true;
    }
  }
}