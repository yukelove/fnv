import 'package:zw_/base/bloc_provider/base_state.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';

class EquipmentDetailState extends BaseState {
  String serialnumber = "";
  late EquipmentModel model;
  bool isEditInfo = false;

  EquipmentDetailState({required String serialnumber,required EquipmentModel model,bool isEditInfo = false}){
    this.serialnumber = serialnumber;
    this.model = model;
    this.isEditInfo = isEditInfo;
  }


  EquipmentDetailState copyWith(String serialnumber,EquipmentModel model){
    return EquipmentDetailState(serialnumber: serialnumber,model: model);
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