import 'package:flutter/material.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/home_page.dart';
import 'package:zw_/router/router_manager.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.router.generator,
      home: HomePage(),
    );
  }
}