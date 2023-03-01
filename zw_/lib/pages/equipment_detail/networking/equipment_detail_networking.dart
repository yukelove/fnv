import 'package:zw_/api/api.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/log_utils.dart';

class EquipmentDetailNetworking {
  //获取设备信息
  static Future<Map> equipmentInfo(String serialnumber) async{
    UserInfo user = await UserInfo.getUserInfo();
    var param = {"userid":user.userid,"token":UserInfo.token,"serialnumber":serialnumber};
    var result = await NetworkingManager.shared().postAsync(
          url: Api.Equipment_DETAIL, data: param);
    Map map = (result["data"] ?? {}) as Map;
          ZWLogUtil.d(result);
    return map;
  }
}