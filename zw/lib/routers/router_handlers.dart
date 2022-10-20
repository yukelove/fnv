import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:zw/ui/home_page.dart';
import 'package:zw/ui/login_page.dart';
import 'package:zw/ui/dynamic_detail_page.dart';
import 'package:zw/ui/splash_page.dart';
import 'package:zw/ui/user_provider.dart';
import 'package:zw/model/user.dart';

Handler homepageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      var name = params['name']?.first;
      var pwd = params['pwd']?.first;
      print('name>,is $name ');
      User user= User(name.toString(),pwd.toString());

      return HomePage(userInfo:user);
    });

Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return LoginPage();
    });

Handler dynamicDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return DynamicDetailPage(id: params[0]?.first,);
    });

Handler splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return  SplashPage();
    });
