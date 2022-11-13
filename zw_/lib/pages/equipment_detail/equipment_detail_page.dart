import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';
import 'package:zw_/router/router_manager.dart';

class EquipmentDetail extends StatefulWidget {
  EquipmentDetail({Key? key}) : super(key: key);

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(54),
          child: CustomAppBar(
            title: "设备详情",
            leadingIcon: ImageAssetsConfig.IMAGE_LEFT_ARROR,
            actionIcon: ImageAssetsConfig.IMAGE_SETTING,
            leadingCallBack: () {
              RouterManager.goBack(context);
            },
            actionCallBack: () {
              RouterManager.jump(context, EQUIPMENT_INFO_EDIT_PAGE);
            },
          )),
      body: Container(
        color: ColorsRes.color_black12,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: SpacerConfig.SPACER_15()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageAssets.image(
                      imgName: ImageAssetsConfig.IMAGE_TEMPERATURE_RED,
                      size: Size(113.0.w, 234.0.w)),
                  ImageAssets.image(
                      imgName: ImageAssetsConfig.IMAGE_DEVICE,
                      size: Size(211.0.w, 171.0.w)),
                  ImageAssets.image(
                      imgName: ImageAssetsConfig.IMAGE_TEMPERATURE_WHITE,
                      size: Size(39.0.w, 200.0.w))
                ],
              ),
            ),
            //输入，输入功率
            Container(
              height: 69.0.w,
              width: 327.0.w,
              margin: EdgeInsets.only(top: SpacerConfig.SPACER_20()),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorsRes.color_929090)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 132.0.w,
                    height: 60.0.w,
                    decoration: BoxDecoration(
                        color: ColorsRes.color_9C9494,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorsRes.color_929090)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Input",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 5, bottom: 5),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "0",
                                  style: TextStyle(
                                      fontSize: FontRes.font_sp16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: " w"),
                            ]))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 132.0.w,
                    height: 60.0.w,
                    decoration: BoxDecoration(
                        color: ColorsRes.color_92937E,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorsRes.color_929090)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Output",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 5, bottom: 5),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "3500",
                                  style: TextStyle(
                                      fontSize: FontRes.font_sp16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: "w")
                            ]))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //折线图
            Container(
              width: 363.0.w,
              height: 98.0.w,
              margin: EdgeInsets.only(top: 106.0.w),
              decoration: BoxDecoration(
                  // color: ColorsRes.color_9C9494,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorsRes.color_929090)),
            ),
            //关闭状态
            Container(
              width: 363.0.w,
              height: 98.0.w,
              margin: EdgeInsets.only(top: 60.0.w),
              decoration: BoxDecoration(
                  // color: ColorsRes.color_9C9494,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorsRes.color_929090)),
            )
          ],
        ),
      ),
    );
  }
}
