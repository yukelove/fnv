import 'package:flutter/material.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';

import '../config/colors_config/color_config.dart';

class CustomAppBar extends StatefulWidget {
  Function leadingCallBack;
  Function actionCallBack;
  String leadingIcon;
  String actionIcon;
  String title;
  CustomAppBar({required this.title,required this.leadingIcon, required this.actionIcon,required this.leadingCallBack,required this.actionCallBack,Key? key}) : super(key: key);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsRes.color_black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  widget.leadingCallBack();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 5.0.w),
                    child: ImageAssets.image(imgName: widget.leadingIcon,size: Size(30.0.w, 30.0.w))),
              ),
              Container(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: FontRes.font_sp16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.actionCallBack();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: ImageAssets.image(
                      imgName: widget.actionIcon,
                      size: Size(20.0.w, 20.0.w)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
