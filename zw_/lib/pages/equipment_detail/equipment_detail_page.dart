import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';
import 'package:zw_/pages/equipment_detail/widgets/equipment_switch_type.dart';
import 'package:zw_/router/router_manager.dart';

class EquipmentDetail extends StatefulWidget {
  EquipmentDetail({Key? key}) : super(key: key);

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    var switchOff = false;
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //头部电压
              Container(
                width: 215.0.w,
                height: 71.0.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsRes.color_9C9494,
                    border: Border.all(color: ColorsRes.color_929090)),
                child: Stack(
                  children: [
                    Positioned(
                        left: 10.0.w,
                        top: 10.0.w,
                        child: Text(
                          "Input",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        left: 40.0.w,
                        bottom: 10.0.w,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "400",
                              style: TextStyle(
                                  fontSize: FontRes.font_sp20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: "v")
                        ])))
                  ],
                ),
              ),
              //温度计
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
              //分割线
              Container(
                margin: EdgeInsets.only(
                    left: SpacerConfig.SPACER_15(),
                    right: SpacerConfig.SPACER_15()),
                height: 1.0,
                color: Colors.black,
              ),
              //各开关状态信息
              Container(
                width: 363.0.w,
                margin: EdgeInsets.only(top: 40.0.w),
                padding:
                    EdgeInsets.only(top: 5.0.w, bottom: 10.0.w, right: 10.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorsRes.color_929090)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.0.w, top: 30.0.w),
                      height: 71.0.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 5.0.w),
                              child: Text(
                                "Type",
                                style: TextStyle(
                                    fontSize: FontRes.font_sp14,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(bottom: 5.0.w),
                              child: Text("Out",
                                  style: TextStyle(
                                      fontSize: FontRes.font_sp14,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          EquipmentSwitchType(
                            imgName: ImageAssetsConfig.IMAGE_AC,
                            powerValue: "3000",
                            switchOff: true,
                          ),
                          EquipmentSwitchType(
                              imgName: ImageAssetsConfig.IMAGE_VOICEMAIL,
                              powerValue: "50",
                              switchOff: false),
                          EquipmentSwitchType(
                              imgName: ImageAssetsConfig.IMAGE_BOX,
                              powerValue: "50",
                              switchOff: true),
                          EquipmentSwitchType(
                              imgName: ImageAssetsConfig.IMAGE_SUNSHINE,
                              powerValue: "50",
                              switchOff: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //PV Input状态信息
              Container(
                width: 363.0.w,
                height: 104.0.w,
                margin: EdgeInsets.only(top: 60.0.w),
                padding: EdgeInsets.only(left: 5.0.w, top: 5.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorsRes.color_929090)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PV Input ",
                            style: TextStyle(
                                fontSize: FontRes.font_sp16,
                                fontWeight: FontWeight.bold)),
                        ImageAssets.image(
                            imgName: ImageAssetsConfig.IMAGE_Cloud,
                            size: Size(20.0.w, 20.0.w))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "50",
                                style: TextStyle(
                                    fontSize: FontRes.font_sp20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: " V",
                                style: TextStyle(fontSize: FontRes.font_sp16)),
                          ])),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "100",
                                style: TextStyle(
                                    fontSize: FontRes.font_sp20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: " W",
                                style: TextStyle(fontSize: FontRes.font_sp16)),
                          ])),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //DC 状态信息
              Container(
                width: 363.0.w,
                height: 69.0.w,
                margin: EdgeInsets.only(top: 60.0.w),
                decoration: BoxDecoration(
                    // color: ColorsRes.color_9C9494,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorsRes.color_929090)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 10,
                      top: -10,
                      child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: switchOff ? ColorsRes.color_30CB96 : ColorsRes.color_7F8A8D,
                      borderRadius: BorderRadius.circular(12.0.w),
                      border: Border.all(color: ColorsRes.color_929090)),
                  child: ImageAssets.image(
                      imgName: ImageAssetsConfig.IMAGE_SWITCH_OFF,
                      size: Size(24.0.w, 24.0.w)))),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0.w),
                            child: ImageAssets.image(
                                imgName: ImageAssetsConfig.IMAGE_PLUG,
                                size: Size(15.0.w, 15.0.w)),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10.0.w, left: 10.0.w),
                                    child: Text.rich(TextSpan(
                                      children: [
                                        TextSpan(text: "DC ",style: TextStyle(fontSize: FontRes.font_sp12)),
                                        TextSpan(text: "12V",style: TextStyle(fontSize: FontRes.font_sp12)),
                                      ]
                                    ))),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10.0.w, right: 30.0.w),
                                    child: Text.rich(TextSpan(
                                      children: [
                                        TextSpan(text: "12v",style: TextStyle(fontSize: FontRes.font_sp12)),
                                        TextSpan(text: "30v",style: TextStyle(fontSize: FontRes.font_sp12)),
                                        TextSpan(text: "  ",style: TextStyle(fontSize: FontRes.font_sp12)),
                                        TextSpan(text: "0",style: TextStyle(fontSize: FontRes.font_sp18,fontWeight: FontWeight.bold)),
                                        TextSpan(text: "W",style: TextStyle(fontSize: FontRes.font_sp12)),
                                      ]
                                    ))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget removeWidget() {
    return //输入，输入功率
        Visibility(
      visible: false,
      child: Container(
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
    );
  }
}
