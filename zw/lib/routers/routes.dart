import 'package:flutter/material.dart';
import './router_handlers.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String splashPath = '/';
  static String loginPath ='/login';
  static String homePath ='/home';
  static String dynamicPath = '/dynamic';
  static String dynamicDetailPath = '$dynamicPath/:id';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler =  Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
        });
    router.define(homePath, handler: homepageHandler);
    router.define(loginPath, handler: loginHandler);
    router.define(dynamicDetailPath, handler: dynamicDetailHandler);
  }
}