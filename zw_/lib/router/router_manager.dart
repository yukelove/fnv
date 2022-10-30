import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zw_/pages/forget_password.dart';
import 'package:zw_/pages/list_page.dart';
import 'package:zw_/pages/login_page.dart';
import 'package:zw_/pages/register_page.dart';

import '../pages/not_found_page.dart';


const LOGIN_PAGE = "LOGIN_PAGE";
const REGISTER_PAGE = "REGISTER_PAGE";
const FORGET_PAGE = "FORGET_PAGE";
const LIST_PAGE = "LISTPAGE";
const EQUIPMENT_DETAIL_PAGE = "EQUIPMENT_DETAIL_PAGE";

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

    //找回密码页
    router.define(FORGET_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ForgetPasswrod();
    }));

    //列表页
    router.define(LIST_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ListPage();
    }));
    

    //设备详情
    router.define(EQUIPMENT_DETAIL_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ListPage();
    }));


  }

  //返回
  static goBack(BuildContext context){
    router.pop(context,);
  }

  static goBackWithParam(BuildContext context,dynamic param){
    router.pop(context,param);
  }

  //路由跳转
  static jump(BuildContext context,String path){
    return router.navigateTo(context, path,transition: TransitionType.inFromRight);
  }
  
  
}