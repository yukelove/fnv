
import 'package:zw_/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';
import 'package:zw_/pages/equipment_list/state/equipment_model.dart';
import 'package:zw_/utils/zw_hud.dart';

import 'package:zw_/pages/equipment_detail/networking/equipment_detail_networking.dart';

class EquipmentSwitchType extends StatefulWidget {
  final String imgName;
  final String powerValue;
  late  bool switchOff;
  late EquipmentModel model;
  late String type;
  EquipmentSwitchType({Key? key,required this.imgName,required this.powerValue,this.switchOff = false, required this.model,required this.type}) : super(key: key);

  @override
  State<EquipmentSwitchType> createState() => _EquipmentSwitchTypeState();
}

class _EquipmentSwitchTypeState extends State<EquipmentSwitchType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: widget.switchOff ? ColorsRes.color_30CB96 : ColorsRes.color_7F8A8D,
                      borderRadius: BorderRadius.circular(12.0.w),
                      border: Border.all(color: ColorsRes.color_929090),
                  ),
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap:callInterface,
                        child:ImageAssets.image(
                          imgName: ImageAssetsConfig.IMAGE_SWITCH_OFF,
                          size: Size(30.0.w, 30.0.w)
                        ),
                  )
              )
          ),
          Container(
            height: SpacerConfig.SPACER_5(),
          ),
          //Info
          Container(
            width: 67.0.w,
            height: 71.0.w,
            decoration: BoxDecoration(
                color: widget.switchOff ? ColorsRes.color_B4B4BC : ColorsRes.color_7F8A8D,
                borderRadius: BorderRadius.circular(10.0.w)),
            padding: EdgeInsets.only(top: 5.0.w, bottom: 5.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageAssets.image(
                    imgName: widget.imgName,
                    size: Size(20.0.w, 20.0.w)),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: widget.powerValue,
                      style: TextStyle(
                          fontSize: FontRes.font_sp12,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: " w")
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void callInterface(){
    print("call interface");
    setState(() {
      if(widget.switchOff){
        ZWHud.showLoading(S.current.turn_off);
        widget.switchOff = false;
        EquipmentDetailNetworking.editEquipmentInfo(widget.model).then((value){
          if(value){
            ZWHud.showText("关闭电源");
            print("call interface success");
          }else{
            print("call interface fail");
          }
        });
        ZWHud.dismissLoadig();
      }else {
        ZWHud.showLoading(S.current.turn_on);
        widget.switchOff = true;
        EquipmentDetailNetworking.editEquipmentInfo(widget.model).then((value){
          if(value){
            ZWHud.showText("打开电源");
            print("call interface success");
          }else{
            print("call interface fail");
          }
        });
        ZWHud.dismissLoadig();
      }
    });

  }
}


