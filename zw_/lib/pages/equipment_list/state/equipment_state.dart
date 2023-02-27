import 'package:zw_/base/bloc_provider/base_state.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';

class EquipmentState extends BaseState{

List<EquipmentModel> list = [];

EquipmentState({required List<EquipmentModel> list}){
  this.list = list;
}


 EquipmentState copyWith(List<EquipmentModel> models){
   return EquipmentState(list: models);
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