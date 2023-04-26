import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:zw_/config/img_config/image_assets.dart';
import 'package:zw_/config/img_config/image_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/user_login/networking/user_networking.dart';
import 'package:zw_/pages/user_register/register_page.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/utils/zw_hud.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TapGestureRecognizer? _tapServer;
  TapGestureRecognizer? _tapPolicy;
  String emailOrMobilePhone = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    _tapServer = TapGestureRecognizer()
      ..onTap = () {
        print('点击 服务条款');
        final Uri url = new Uri(scheme: "https", host: "www.baidu.com");
        _launchUrl(url);
      };
    _tapPolicy = TapGestureRecognizer()
      ..onTap = () {
        print('点击 隐私政策');
        final Uri url = Uri.parse("http://101.43.96.59/fnv_yszc.html");
        _launchUrl(url);
      };
  }

  @override
  void dispose() {
    _tapServer?.dispose(); // 销毁对象
    _tapPolicy?.dispose(); // 销毁对象
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle linkStyle = const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue);

    final TextStyle defaultStyle = const TextStyle(color: Colors.black);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: ImageAssets.image(
                imgName: ImageAssetsConfig.IMAGE_LOGO,
                size: Size(330.0.w, 85.0.w)),
          ),
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 30, top: 30),
          //       child: Text(
          //         S.of(context).login,
          //         style: TextStyle(color: Colors.black, fontSize: 33),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            width: 100,
            height: 70,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: S.of(context).emailorphonenumer,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              this.emailOrMobilePhone = value;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: S.of(context).loginpassword,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              this.password = value;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: TextButton(
                                  onPressed: () {
                                    if(emailOrMobilePhone.isNotEmpty && password.isNotEmpty && checkboxSelected){
                                      UserNetworking.userLogin(
                                          emailOrMobilePhone:
                                          emailOrMobilePhone,
                                          password: password)
                                          .then((value) {
                                        if (value) {
                                          RouterManager.jump(
                                              context, EQUIPMENT_LIST_PAGE);
                                        }
                                      });
                                    }else{
                                      if(emailOrMobilePhone.isEmpty && password.isEmpty) {
                                        ZWHud.showText(S
                                            .of(context)
                                            .name_password_need);
                                      }else if(!checkboxSelected){
                                        ZWHud.showText(S
                                            .of(context)
                                            .user_agree_select_need);
                                      }

                                    }
                                  },
                                  child: Text(
                                    S.of(context).login,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _colorfulCheckBox(),
                              Expanded(
                                  //   child: Text(S.of(context).agrementdesc,
                                  //   textAlign: TextAlign.left,
                                  //   style: TextStyle(
                                  //       decoration: TextDecoration.underline,
                                  //       color: Color(0xff4c505b),
                                  //       fontSize: 12),
                                  // ),
                                  child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: S.of(context).agrementdesc,
                                    style: defaultStyle),
                                TextSpan(
                                    text: S.of(context).serviceagreement,
                                    style: linkStyle,
                                    recognizer: _tapServer),
                                TextSpan(text: '&', style: defaultStyle),
                                TextSpan(
                                    text: S.of(context).privacypolicy,
                                    style: linkStyle,
                                    recognizer: _tapPolicy),
                                TextSpan(text: '.', style: defaultStyle),
                              ]))),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  RouterManager.jump(context, REGISTER_PAGE);
                                },
                                child: Text(
                                  S.of(context).register,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    RouterManager.jump(context, FORGET_PAGE);
                                  },
                                  child: Text(
                                    S.of(context).forgotpassword,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkboxSelected = false;

  Checkbox _colorfulCheckBox() {
    return Checkbox(
        value: checkboxSelected,
        onChanged: (value) {
          checkboxSelected = !checkboxSelected;
          setState(() {});
        });
  }

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      setState(() {});
    }
  }
}
