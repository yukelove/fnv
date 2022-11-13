import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';

class InfoListItem extends StatefulWidget {
  final String icon;
  final String title;
  late final Function? itemClickCallBack;
  InfoListItem(
      {Key? key,
      required this.icon,
      required this.title,
      Function? itemClickCallBack})
      : super(key: key) {
    this.itemClickCallBack = itemClickCallBack;
  }

  @override
  State<InfoListItem> createState() => _InfoListItemState();
}

class _InfoListItemState extends State<InfoListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0.w,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: SpacerConfig.SPACER_10()),
              child: ImageAssets.image(
                  imgName: widget.icon, size: Size(20.0.w, 20.0.w))),
          Container(
            margin: EdgeInsets.only(left: SpacerConfig.SPACER_10()),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: FontRes.font_sp14, color: ColorsRes.color_3D3D3D),
            ),
          ),
          Spacer(),
          Container(
              margin: EdgeInsets.only(right: SpacerConfig.SPACER_10()),
              child: ImageAssets.image(
                  imgName: ImageAssetsConfig.IMAGE_RIGHT_ARROR,
                  size: Size(15.0.w, 15.0.w)))
        ],
      ),
    );
  }
}
