import 'package:zw_/base/bloc_provider/base_cubit.dart';

import 'package:zw_/pages/charge_time/state/conserve_energy_config_state.dart';

import 'package:zw_/pages/charge_time/networking/conserve_energy_config_networking.dart';
import 'package:zw_/pages/charge_time/state/conserve_energy_config_model.dart';
class ConserveEnergyConfigCubit extends BaseCubit<ConserveEnergyConfigState> {
  ConserveEnergyConfigCubit(ConserveEnergyConfigState t) : super(t) {
    if (t.isEditInfo) {
      ConserveEnergyConfigEditInfo();
    } else {
      ConserveEnergyConfigInfo();
    }
  }

  ConserveEnergyConfigInfo() {
    //获取节能配置信息
    ConserveEnergyConfigNetworking.timeConfigQuery(state.serialnumber).then((value) {
      var info = value;
      var model = ConserveEnergyConfigModel.fromJson(info);
      emit(state.copyWith(state.serialnumber, model));
    });
  }

  //获取编辑信息
  ConserveEnergyConfigEditInfo() {
    ConserveEnergyConfigNetworking.timeConfigQuery(state.serialnumber)
        .then((value) {
      var info = value;
      // var model = EquipmentModel.fromJson(info);
      // emit(state.copyWith(state.serialnumber, model));
    });
  }
}