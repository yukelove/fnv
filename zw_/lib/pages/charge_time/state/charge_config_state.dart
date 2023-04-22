import 'package:zw_/base/bloc_provider/base_state.dart';
import 'package:zw_/pages/charge_time/state/charge_config_model.dart';

class ChargeConfigState extends BaseState {
  String serialnumber = "";
  late ChargeConfigModel model;
  bool isEditInfo = false;

  ChargeConfigState({required String serialnumber,required ChargeConfigModel model,bool isEditInfo = false}){
    this.serialnumber = serialnumber;
    this.model = model;
    this.isEditInfo = isEditInfo;
  }


  ChargeConfigState copyWith(String serialnumber,ChargeConfigModel model){
    return ChargeConfigState(serialnumber: serialnumber,model: model);
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