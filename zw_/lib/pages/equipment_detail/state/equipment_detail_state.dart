import 'package:zw_/base/bloc_provider/base_state.dart';

class EquipmentDetailState extends BaseState {
  String serialnumber = "";
  Map info = {};

  EquipmentDetailState({required String serialnumber,required Map info}){
    this.serialnumber = serialnumber;
    this.info = info;
  }


  EquipmentDetailState copyWith(String serialnumber,Map info){
    return EquipmentDetailState(serialnumber: serialnumber,info: info);
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