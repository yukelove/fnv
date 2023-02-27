import 'package:zw_/base/bloc_provider/base_cubit.dart';
import 'package:zw_/pages/equipment_list/networking/equipment_networking.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';
import 'package:zw_/pages/equipment_list/state/equipment_state.dart';

class EquipmentCubit extends BaseCubit<EquipmentState> {
  EquipmentCubit(EquipmentState t):super(t){
    //获取设备列表
    getEquipmentList();
  }

  void getEquipmentList(){
    EquipmentNetworking.equipmentList().then((value) {
      if(value != null){
        List<EquipmentModel> list = value.map((element){
          print("${element}");
          return EquipmentModel.fromJson(element as Map);
        }).toList();
        emit(state.copyWith(list));
      }
    });
  }
  
}