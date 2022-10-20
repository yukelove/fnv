import 'package:flutter/material.dart';
import 'package:zw/model/user.dart';
import 'package:zw/ui/user_provider.dart';
import 'package:zw/ui/login_page.dart';

class HomePage extends StatefulWidget {
  final User userInfo;
  HomePage({super.key, required this.userInfo});
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /**
     * 根据是否有用户登录信息进入登录注册页面或者主页
        利用inheritedWidget，可以读取到父控件分享的数据
     */
    // User? user = UserContainer.of(context)?.user;

    if (widget.userInfo == null || widget.userInfo.username.isEmpty || widget.userInfo.password.isEmpty) {
      return const  LoginPage();
    } else {
      return  Scaffold(
        body:  Center(
          child:  Text("用户已登录\n用户名:${widget.userInfo.username}\n密码：${widget.userInfo.password}"),
        ),
      );
    }
  }
}
