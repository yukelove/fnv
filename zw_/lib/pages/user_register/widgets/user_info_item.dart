import 'package:flutter/material.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_register/widgets/user_info_item_header.dart';

class UserInfoItem extends StatefulWidget {
  List subItems;
  String title;
  UserInfoItem({required this.title, required this.subItems, Key? key})
      : super(key: key);

  @override
  State<UserInfoItem> createState() => _UserInfoItemState();
}

class _UserInfoItemState extends State<UserInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserInfoItemHeader(
            title: widget.title,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: widget.subItems.length,
              itemBuilder: (context, index) {
                var itemTitle = widget.subItems[index] as String;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //点击
                      },
                      child: Container(
                        height: 54.0.w,
                        child: Row(children: [
                          SizedBox(
                            width: 50.0.w,
                          ),
                          Text(
                            itemTitle,
                            style: TextStyle(
                                fontSize: FontRes.font_sp14,
                                color: ColorsRes.color_3D3D3D),
                          ),
                          Spacer(),
                          ImageAssets.image(
                              imgName: ImageAssetsConfig.IMAGE_RIGHT_ARROR,
                              size: Size(15.0.w, 15.0.w)),
                          SizedBox(
                            width: 20.0.w,
                          ),
                        ]),
                      ),
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
