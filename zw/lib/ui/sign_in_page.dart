import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zw/style/theme.dart' as theme;
import 'package:zw/routers/application.dart';
import 'package:zw/routers/routes.dart';
import 'dart:core';
import 'dart:convert';
import 'package:zw/utils/http_util.dart';
///注册界面
class SignInPage extends StatefulWidget {
   SignInPage({super.key});
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  ///利用FocusNode和FocusScopeNode来控制焦点可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode

  FocusNode emailFocusNode =  FocusNode();
  FocusNode passwordFocusNode =  FocusNode();
  FocusScopeNode focusScopeNode =  FocusScopeNode();

  GlobalKey<FormState> _SignInFormKey =  GlobalKey();

  List getList = [];
  List postList = [];

  bool isShowPassWord = false;
  String _name="";
  String _password="";

  get url => null;

  get serviceUrl => null;

  _postData() async {

    DioUtil.getInstance().request(url, serviceUrl: serviceUrl);
    var response = await http.post("https://api.apiopen.top/videoHomeTab");
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      List listJsonMap = map['result'];
      setState(() {
        postList = listJsonMap;
      });
    } else {
      getList = ['code', 500];
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 23),
      child:  Stack(
        alignment: Alignment.center,
//        /**
//         * 注意这里要设置溢出如何处理，设置为visible的话，可以看到孩子，
//         * 设置为clip的话，若溢出会进行裁剪
//         */
//        overflow: Overflow.visible,
        children: <Widget>[
           Column(
            children: <Widget>[
              //创建表单
              buildSignInTextForm(),

              const Padding(
                padding: EdgeInsets.only(top: 50),
                child:  Text("Forgot Password?",
                  style:  TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline),),
              ),

              /**
               * Or所在的一行
               */
//               Padding(padding: EdgeInsets.only(top: 10),
//                 child:  Row(
// //                          mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                      Container(height: 1,
//                       width: 100,
//                       decoration: const BoxDecoration(
//                           gradient:  LinearGradient(
//                               colors: [ Colors.white10,
//                               Colors.white,
//                               ])
//                       ),
//                     ),
//                      const Padding(
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       child:  Text("Or", style:  TextStyle(
//                           fontSize: 16, color: Colors.white),),),
//                      Container(height: 1,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           gradient:  LinearGradient(
//                               colors: [ Colors.white,
//                               Colors.white10,
//                               ])
//                       ),
//                     ),
//                   ],
//                 ),),

              /**
               * 显示第三方登录的按钮
               */
              //  const SizedBox(height: 10,),
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //      Container(
              //       padding: const EdgeInsets.all(10),
              //       decoration: const BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.white,
              //       ),
              //       child:  const IconButton(icon: Icon(
              //         FontAwesomeIcons.facebookF, color: Color(0xFF0084ff),),
              //           onPressed: null),
              //     ),
              //      const SizedBox(width: 40,),
              //      Container(
              //       padding: EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.white,
              //       ),
              //       child:  const IconButton(icon: Icon(
              //         FontAwesomeIcons.google, color: Color(0xFF0084ff),),
              //           onPressed: null),
              //     ),
              //   ],
              // )


            ],
          ),
           Positioned(child: buildSignInButton(), top: 170,)
        ],
      ),
    );
  }

  /// 点击控制密码是否显示
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  /// 创建登录界面的TextForm
  Widget buildSignInTextForm() {
    return  Container(
      decoration:
       BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))
          , color: Colors.white
      ),
      width: 300,
      height: 190,
      /**
       * Flutter提供了一个Form widget，它可以对输入框进行分组，
       * 然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
       */
      child:  Form(
        key: _SignInFormKey,
        //开启自动检验输入内容，最好还是自己手动检验，不然每次修改子孩子的TextFormField的时候，其他TextFormField也会被检验，感觉不是很好
//        autovalidate: true,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child:  TextFormField(
                  //关联焦点
                  focusNode: emailFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },

                  decoration:  const InputDecoration(
                      icon:  Icon(Icons.email, color: Colors.black,),
                      hintText: "Email Address",
                      border: InputBorder.none
                  ),
                  style:  const TextStyle(fontSize: 16, color: Colors.black),
                  //验证
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return "Email can not be empty!";
                    }
                  },
                  onSaved: (value) {
                    _name=value!;
                    print(value);
                  },
                ),
              ),
            ),
             Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20),
                child:  TextFormField(
                  focusNode: passwordFocusNode,
                  decoration:  InputDecoration(
                      icon:  const Icon(Icons.lock, color: Colors.black,),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon:  IconButton(icon:  const Icon(
                        Icons.remove_red_eye, color: Colors.black,),
                          onPressed: showPassWord)
                  ),
                  //输入密码，需要用*****显示
                  obscureText: !isShowPassWord,
                  style:  const TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "Password'length must longer than 6!";
                    }
                  },
                  onSaved: (value) {
                    _password=value!;
                  },
                ),
              ),
            ),


          ],
        ),),
    );
  }

  ///创建登录界面的按钮
  Widget buildSignInButton() {
    return
       GestureDetector(
        child:  Container(
          padding: const EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: theme.Theme.primaryGradient,
          ),
          child:  const Text(
            "LOGIN", style:  TextStyle(fontSize: 25, color: Colors.white),),
        ),
        onTap: () {
          /**利用key来获取widget的状态FormState
              可以用过FormState对Form的子孙FromField进行统一的操作
           */
          if (_SignInFormKey.currentState?.validate()??true) {
            //如果输入都检验通过，则进行登录操作
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text("登录中。。。。")));
            //调用所有自孩子的save回调，保存表单内容
            _SignInFormKey.currentState?.save();
            Application.router.navigateTo(context, '${Routes.homePath}?name=${Uri.encodeComponent(_name)}&pwd=${Uri.encodeComponent(_password)}');
          }
//          debugDumpApp();
        },

      );
  }


}