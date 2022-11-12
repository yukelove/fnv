import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';

class EquipmentGridItem extends StatefulWidget {

  Function itemClick;
  dynamic itemModel;

  EquipmentGridItem({required this.itemModel,required this.itemClick,Key? key}) : super(key: key);

  @override
  State<EquipmentGridItem> createState() => _EquipmentGridItemState();
}

class _EquipmentGridItemState extends State<EquipmentGridItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.itemClick(widget.itemModel);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                  ImageAssets.getImgPath(ImageAssetsConfig.IMAGE_EQUIPMENT_BG))),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: SpacerConfig.SPACER_20(),
            horizontal: SpacerConfig.SPACER_15(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageAssets.image(
                  imgName: ImageAssetsConfig.IMAGE_DEVICE,
                  size: Size(100.0.w, 67.0.w)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: SpacerConfig.SPACER_15(), bottom: 5),
                    child: Text(
                      "Device 1",
                      style: TextStyle(
                        color: ColorsRes.color_white,
                        fontSize: FontRes.font_sp12,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: SpacerConfig.SPACER_30()),
                    child: Text(
                      "45%",
                      style: TextStyle(
                        color: ColorsRes.color_white,
                        fontSize: FontRes.font_sp12,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding:
                    EdgeInsets.only(left: SpacerConfig.SPACER_15(),right: SpacerConfig.SPACER_50()),
                child: LinearProgressIndicator(
                  backgroundColor: ColorsRes.color_black,
                  valueColor: AlwaysStoppedAnimation(ColorsRes.color_40F717),
                  value: Random(100).nextDouble(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
