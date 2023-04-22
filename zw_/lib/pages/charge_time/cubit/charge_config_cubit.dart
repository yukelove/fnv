import 'package:zw_/base/bloc_provider/base_cubit.dart';

import 'package:zw_/pages/charge_time/state/charge_config_state.dart';

import 'package:zw_/pages/charge_time/networking/charge_config_networking.dart';
import 'package:zw_/pages/charge_time/state/charge_config_model.dart';
class ChargeConfigCubit extends BaseCubit<ChargeConfigState> {
  ChargeConfigCubit(ChargeConfigState t) : super(t) {
    if (t.isEditInfo) {
      ChargeConfigEditInfo();
    } else {
      ChargeConfigInfo();
    }
  }

  ChargeConfigInfo() {
    //获取节能配置信息
    ChargeConfigNetworking.timeConfigQuery(state.serialnumber).then((value) {
      var info = value;
      var model = ChargeConfigModel.fromJson(info);
      emit(state.copyWith(state.serialnumber, model));
    });
  }

  //获取编辑信息
  ChargeConfigEditInfo() {
    ChargeConfigNetworking.timeConfigQuery(state.serialnumber)
        .then((value) {
      var info = value;
      // var model = EquipmentModel.fromJson(info);
      // emit(state.copyWith(state.serialnumber, model));
    });
  }
}