import 'package:flutter/material.dart';
import 'package:zw_/pages/user_login/login_page.dart';
import 'package:zw_/pages/user_register/register_page.dart';
import 'package:zw_/router/router_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    //路由注册
    RouterManager.initRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}
