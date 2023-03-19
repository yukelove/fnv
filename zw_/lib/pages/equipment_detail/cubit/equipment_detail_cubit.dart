import 'package:zw_/base/bloc_provider/base_cubit.dart';
import 'package:zw_/pages/equipment_detail/networking/equipment_detail_networking.dart';
import 'package:zw_/pages/equipment_detail/state/equipment_detail_state.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';

class EquipmentDetailCubit extends BaseCubit<EquipmentDetailState> {
  EquipmentDetailCubit(EquipmentDetailState t) : super(t) {
    if (t.isEditInfo) {
      equipmentEditInfo();
    } else {
      equipmentInfo();
    }
  }

  equipmentInfo() {
    //获取设备信息
    EquipmentDetailNetworking.equipmentInfo(state.serialnumber).then((value) {
      var info = value;
      var model = EquipmentModel.fromJson(info);
      emit(state.copyWith(state.serialnumber, model));
    });
  }

  //获取编辑信息
  equipmentEditInfo() {
    EquipmentDetailNetworking.equipmentEditInfo(state.serialnumber)
        .then((value) {
      var info = value;
      // var model = EquipmentModel.fromJson(info);
      // emit(state.copyWith(state.serialnumber, model));
    });
  }

  //修改设备信息
  /*
  {"serialnumber":"F221120003",
"deviceName": "EMETC-01",
"chargeLimit": 98,
"disChargeLimit": 10,
"acChargeRate": 50,
"carCharge": 1,
"buzzer": 1,
"screenBrightness": 0,
"standByTime": "10"
}
  */
  editEquipment() {}
}
