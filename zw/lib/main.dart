// @dart=2.9
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zw/model/user.dart';
import 'package:zw/ui/home_page.dart';
import 'package:zw/ui/login_page.dart';
import 'package:zw/ui/user_provider.dart';
import 'package:zw/routers/application.dart' show Application;
import 'package:zw/routers/routes.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  // 这里设置项目环境
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String url="";
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Login',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
      home:  UserContainer(user: User("",""),child:   HomePage(userInfo: User("","")),),
    );
  }
}


