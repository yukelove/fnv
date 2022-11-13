import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_register/widgets/user_info_item.dart';
import 'package:zw_/router/router_manager.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Personal settings",
      "subtitles": [
        "head avatar",
        "Nickname",
        "Mobile phone",
      ],
    },
    {
      "title": "Account settings",
      "subtitles": ["Change password", "Wechat", "Account cancellation"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets = items.map((e) {
      var subItemMap = e;
      var title = subItemMap["title"] as String;
      var subItemTitles = subItemMap["subtitles"] as List;
      return UserInfoItem(
        title: title,
        subItems: subItemTitles,
      );
    }).toList();
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: "Account Manage",
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
        ),
        preferredSize: Size.fromHeight(54),
      ),
      body: Container(
        color: ColorsRes.color_black12,
        child: Column(
          children: [
            itemWidgets.first,
            itemWidgets.last,
            //退出登录按钮
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ImageAssets.image(
                            imgName: ImageAssetsConfig.IMAGE_LOGIN_REGISTER_BG,size: Size(237.0.w,61.0.w)),
                      Positioned(
                        left: 70,
                        top: 20,
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: FontRes.font_sp18
                          ),
                        )
                        )
                    ],
                  ),
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}
