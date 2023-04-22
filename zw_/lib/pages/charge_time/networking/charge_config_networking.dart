import 'package:zw_/api/api.dart';
import 'package:zw_/constant/constant_declare.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/utils/local_cache.dart';
import 'package:zw_/utils/log_utils.dart';
import 'package:zw_/utils/zw_hud.dart';

import '../state/charge_config_model.dart';
import 'dart:convert';

class ChargeConfigNetworking {
  static Future<bool> timeConfigSave( ChargeConfigModel chargeConfigModel) async {
    if (chargeConfigModel.serialnumber.isEmpty || chargeConfigModel.times9.isEmpty || chargeConfigModel.timeSwitch9.isNaN) {
      ZWHud.showText(S.current.field_need);
      return false;
    }

    ZWHud.showLoading(S.current.toast_requesting);

    print(chargeConfigModel.toJson());
    Map<String, dynamic>? param  = chargeConfigModel.toJson();
    var result = await NetworkingManager.shared().postAsync(
        url: Api.SET_DEVICES_SWITCH_CONFIG, data: param);
    var code = result["code"];
    var msg = result["msg"];
    if (code == -1) {
      ZWHud.showText(msg.toString());
      return false;
    } else {
      ZWHud.showText(S.current.save_success);
      return true;
    }
  }

  static Future<Map> timeConfigQuery( String serialNumber) async {
    ZWHud.showLoading(S.current.toast_requesting);
    var param = {
      "serialNumber": serialNumber,
      "language": "CN"
    };
    var result = await NetworkingManager.shared().postAsync(
        url: Api.QUERY_DEVICES_SWITCH_CONFIG, data: param);
    Map map = (result["data"] ?? {}) as Map;
    ZWLogUtil.d(map);
    ZWLogUtil.d("query info === ${result}");
    if (result is Map) {
      var code = result['code'];
      var msg = result['msg'];
      if (null != code && code.toString().isNotEmpty && code.toString().compareTo("1") > -1) {
        ZWHud.dismissLoadig();
      } else {
        if (null != msg) {
          ZWHud.showText(msg.toString());
        } else {
          ZWHud.showText("查询失败");
        }
      }
    } else {
      ZWHud.showText("查询失败");
    }
    return map;
  }
}
