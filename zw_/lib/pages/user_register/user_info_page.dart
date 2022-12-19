import 'package:flutter/material.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/generated/l10n.dart';
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
      "title": S.current.personalsettings,
      "subtitles": [
        S.current.headavatar,
        S.current.nickname,
        S.current.mobilephone,
      ],
    },
    {
      "title": S.current.accountsettings,
      "subtitles": [S.current.changepassword,S.current.wechat, S.current.accountcancel]
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
          title: S.current.accountmanage,
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
        ),
        preferredSize: Size.fromHeight(54),
      ),
      body: Container(
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
                      new TextButton(
                        child: ImageAssets.image(
                          imgName: ImageAssetsConfig.IMAGE_LOGIN_REGISTER_BG,size: Size(237.0.w,61.0.w)),
                        onPressed: () {
                          RouterManager.logOut(
                              context, LOGIN_PAGE);
                        },
                      ),
                      Positioned(
                        left: 70,
                        top: 20,
                        child:InkWell(
                            child: Text(
                              S.current.logout,
                              style: TextStyle(
                                  fontSize: FontRes.font_sp18
                              ),
                            ),
                            onTap: (){
                              RouterManager.logOut(
                                  context, LOGIN_PAGE);
                            }
                        ),
                        ),
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
