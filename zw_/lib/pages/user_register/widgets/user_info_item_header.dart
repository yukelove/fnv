import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/config/spacer_config/SpacerConfig.dart';

class UserInfoItemHeader extends StatefulWidget {
  final String title;
  UserInfoItemHeader({required this.title,Key? key}) : super(key: key);

  @override
  State<UserInfoItemHeader> createState() => _UserInfoItemHeaderState();
}

class _UserInfoItemHeaderState extends State<UserInfoItemHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: SpacerConfig.SPACER_20(),bottom: SpacerConfig.SPACER_15(),top: SpacerConfig.SPACER_15()),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: FontRes.font_sp18,color: ColorsRes.color_3D3D3D),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Container(
              margin: EdgeInsets.only(left: SpacerConfig.SPACER_20(),right: SpacerConfig.SPACER_20()),
              color: ColorsRes.color_black,
              height: 2.0.w,
            ),
          )
        ],
      ),
    );
  }
}
