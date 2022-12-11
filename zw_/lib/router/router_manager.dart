import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zw_/pages/equipment_add/equipment_add_page.dart';
import 'package:zw_/pages/equipment_detail/equipment_info_edit_page.dart';
import 'package:zw_/pages/equipment_detail/equipment_detail_page.dart';
import 'package:zw_/pages/user_register/forget_password.dart';
import 'package:zw_/pages/equipment_list/list_page.dart';
import 'package:zw_/pages/user_login/login_page.dart';
import 'package:zw_/pages/user_register/register_page.dart';
import 'package:zw_/pages/user_register/user_info_page.dart';
import 'not_found_page.dart';


const LOGIN_PAGE = "LOGIN_PAGE";
const REGISTER_PAGE = "REGISTER_PAGE";
const FORGET_PAGE = "FORGET_PAGE";
const EQUIPMENT_LIST_PAGE = "EQUIPMENT_LISTPAGE";
const EQUIPMENT_DETAIL_PAGE = "EQUIPMENT_DETAIL_PAGE";
const EQUIPMENT_INFO_EDIT_PAGE = "EQUIPMENT_INFO_EDIT_PAGE";
const EQUIPMENT_ADD_PAGE = "EQUIPMENT_ADD_PAGE";
const USER_INFO_PAGE = "USER_INFO_PAGE";

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

    //用户信息页
    router.define(USER_INFO_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return UserInfoPage();
    }));

    //找回密码页
    router.define(FORGET_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ForgetPasswrod();
    }));

    //列表页
    router.define(EQUIPMENT_LIST_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return ListPage();
    }));
    

    //设备详情
    router.define(EQUIPMENT_DETAIL_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return EquipmentDetail();
    }));

    //设备信息修改
    router.define(EQUIPMENT_INFO_EDIT_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return EquipmentInfoEditPage();
    }));


    //设备添加
    router.define(EQUIPMENT_ADD_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return EquipmentAddPage();
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
  static Future jump(BuildContext context,String path){
    return router.navigateTo(context, path,transition: TransitionType.inFromRight);
  }
  
  
}