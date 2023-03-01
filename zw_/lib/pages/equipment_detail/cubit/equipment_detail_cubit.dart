import 'package:zw_/base/bloc_provider/base_cubit.dart';
import 'package:zw_/pages/equipment_detail/networking/equipment_detail_networking.dart';
import 'package:zw_/pages/equipment_detail/state/equipment_detail_state.dart';

class EquipmentDetailCubit extends BaseCubit<EquipmentDetailState> {
  
  EquipmentDetailCubit(EquipmentDetailState t):super(t){
    equipmentInfo();
  }

  equipmentInfo(){
    //获取设备信息
    EquipmentDetailNetworking.equipmentInfo(state.serialnumber).then((value){
      //
      var info = value;
      emit(state.copyWith(state.serialnumber, info));
    });
  }
  

}