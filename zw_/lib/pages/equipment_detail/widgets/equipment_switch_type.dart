import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';

class EquipmentSwitchType extends StatefulWidget {
  final String imgName;
  final String powerValue;
  final bool switchOff;
  EquipmentSwitchType({Key? key,required this.imgName,required this.powerValue,this.switchOff = false}) : super(key: key);

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
                  decoration: BoxDecoration(
                      color: widget.switchOff ? ColorsRes.color_30CB96 : ColorsRes.color_7F8A8D,
                      borderRadius: BorderRadius.circular(12.0.w),
                      border: Border.all(color: ColorsRes.color_929090)),
                  child: ImageAssets.image(
                      imgName: ImageAssetsConfig.IMAGE_SWITCH_OFF,
                      size: Size(24.0.w, 24.0.w)))),
          Container(
            height: SpacerConfig.SPACER_5(),
          ),
          //Info
          Container(
            width: 67.0.w,
            height: 71.0.w,
            decoration: BoxDecoration(
                color: ColorsRes.color_B4B4BC,
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
}
