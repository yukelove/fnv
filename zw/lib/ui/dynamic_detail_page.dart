import 'package:flutter/material.dart';
import 'package:zw/model/user.dart';
import 'package:zw/ui/user_provider.dart';
import 'package:zw/ui/login_page.dart';

class DynamicDetailPage extends StatefulWidget {
  late String id;
  DynamicDetailPage({super.key,required String? id});
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<DynamicDetailPage> {
  @override
  Widget build(BuildContext context) {
    /**
     * 根据是否有用户登录信息进入登录注册页面或者主页
        利用inheritedWidget，可以读取到父控件分享的数据
     */
    User? user = UserContainer.of(context)?.user;
    if (user == null || user.username.isEmpty || user.password.isEmpty) {
      return const  LoginPage();
    } else {
      return  Scaffold(
        body:  Center(
          child:  Text("用户已登录\n用户名:${user.username}\n密码：${user.password}"),
        ),
      );
    }
  }
}
