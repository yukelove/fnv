import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zw_/pages/list_page.dart';
import 'package:zw_/pages/login_page.dart';
import 'package:zw_/pages/register_page.dart';

import '../pages/not_found_page.dart';


const LOGIN_PAGE = "LOGIN_PAGE";
const REGISTER_PAGE = "REGISTER_PAGE";
const LIST_PAGE = "LISTPAGE";

class RouterManager {
  static final FluroRouter router = FluroRouter();

  static initRoutes(){
    router.notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return const NotFoundPage();
    });
    RouterManager.addAllRoute(router);
  }

  static void addAllRoute(FluroRouter router){
    //登录页
    router.define(LOGIN_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return LoginPage();
    }));

    //注册页
    router.define(REGISTER_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return RegisterPage();
    }));

    //列表页
    router.define(LIST_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ListPage();
    }));


    // router.define("LOGIN", handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
    //   return Container();
    // }));
  }
  
  
}