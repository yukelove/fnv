import 'package:zw_/api/api.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';

class EquipmentNetworking {
  static Future<List> equipmentList() async{
    UserInfo user = await UserInfo.getUserInfo();
    var param = {"userid":user.userid,"token":UserInfo.token};
    var result = await NetworkingManager.shared().postAsync(
          url: Api.Equipment_LIST, data: param);
    var list = result["data"] ?? [{}];
          ZWLogUtil.d(result);
    return list as List;
  }
}