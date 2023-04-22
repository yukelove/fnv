import 'package:zw_/base/bloc_provider/base_state.dart';
import 'package:zw_/pages/charge_time/state/conserve_energy_config_model.dart';

class ConserveEnergyConfigState extends BaseState {
  String serialnumber = "";
  late ConserveEnergyConfigModel model;
  bool isEditInfo = false;

  ConserveEnergyConfigState({required String serialnumber,required ConserveEnergyConfigModel model,bool isEditInfo = false}){
    this.serialnumber = serialnumber;
    this.model = model;
    this.isEditInfo = isEditInfo;
  }


  ConserveEnergyConfigState copyWith(String serialnumber,ConserveEnergyConfigModel model){
    return ConserveEnergyConfigState(serialnumber: serialnumber,model: model);
  }

  @override
  BaseState clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  BaseState init() {
    // TODO: implement init
    throw UnimplementedError();
  }

}