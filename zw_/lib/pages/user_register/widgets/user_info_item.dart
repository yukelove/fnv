import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/config/colors_config/color_config.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_register/widgets/user_info_item_header.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';
import 'package:zw_/pages/user_login/user_info/user_info.dart';
import 'package:zw_/pages/user_register/widgets/account_cancel_widget.dart';

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
                        print("点击了" + itemTitle);
                        if(S.current.changepassword == itemTitle){
                          String path = "${MODIFY_PASSWORD}";
                          RouterManager.jump(context, path);
                        }else if(S.current.accountcancel == itemTitle){
                          String showContent  = "账号注销后，您将无法正常使用本应用，与账号相关的数据，包括关联产品及运行配置信息也将同时清除，请谨慎操作！";
                          // this.showCustomDialog(context,showContent, index);
                          // Navigator.push(context,  PopRoute(child: AccountCancelWidget()));
                          String path = "${ACCOUNT_CANCEL_WIDGET}";
                          RouterManager.jump(context, path);
                        }
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

  void showCustomDialog(BuildContext context,String showContent,int position ){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title:new Text("点击提示"),
            content:new SingleChildScrollView(
                child:new ListBody(children: [new Text("${showContent}")])),
            actions: [
              new TextButton(
                child:new Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new TextButton(
                child:new Text("确认"),
                onPressed: (){
                  Navigator.of(context).pop();
                  ZWHud.showLoading(S.current.toast_requesting);
                  String password  = "";
                  UserNetworking.accountCancel(password,"注销原因").then((value) {
                    if(value){
                      ZWHud.showText(S.current.account_cancel_success);
                      RouterManager.logOut(context, LOGIN_PAGE);
                    }
                  });
                },
              ),
            ],
          );
        });
  }
}
