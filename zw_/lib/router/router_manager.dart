import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zw_/pages/charge_time/conserve_energy_config_page.dart';
import 'package:zw_/pages/equipment_add/equipment_add_page.dart';
import 'package:zw_/pages/equipment_detail/equipment_info_edit_page.dart';
import 'package:zw_/pages/equipment_detail/equipment_detail_page.dart';
import 'package:zw_/pages/user_register/forget_password.dart';
import 'package:zw_/pages/equipment_list/list_page.dart';
import 'package:zw_/pages/user_login/login_page.dart';
import 'package:zw_/pages/user_register/register_page.dart';
import 'package:zw_/pages/user_register/user_info_page.dart';
import 'package:zw_/pages/charge_time/conserve_energy_config_form_page.dart';
import 'package:zw_/pages/charge_time/charge_config_form_page.dart';
import 'package:zw_/pages/tools/date_time_picker_page.dart';
import 'package:zw_/pages/user_login/modify_password.dart';
import 'package:zw_/pages/user_register/widgets/account_cancel_widget.dart';
import 'package:zw_/pages/user_login/user_info/modify_user_info_widget.dart';
import 'package:zw_/pages/equipment_add/add_equipment_manual.dart';
import 'not_found_page.dart';


const LOGIN_PAGE = "LOGIN_PAGE";
const REGISTER_PAGE = "REGISTER_PAGE";
const FORGET_PAGE = "FORGET_PAGE";
const EQUIPMENT_LIST_PAGE = "EQUIPMENT_LISTPAGE";
const EQUIPMENT_DETAIL_PAGE = "EQUIPMENT_DETAIL_PAGE";
const EQUIPMENT_INFO_EDIT_PAGE = "EQUIPMENT_INFO_EDIT_PAGE";
const EQUIPMENT_ADD_PAGE = "EQUIPMENT_ADD_PAGE";
const USER_INFO_PAGE = "USER_INFO_PAGE";
const CONSERVE_ENERGY_CONFIG_PAGE = "CONSERVE_ENERGY_CONFIG_PAGE";
const CONSERVE_ENERGY_CONFIG_FORM_PAGE = "CONSERVE_ENERGY_CONFIG_FORM_PAGE";
const CHARGE_CONFIG_FORM_PAGE = "CHARGE_CONFIG_FORM_PAGE";
const DATE_TIME_PICKER_PAGE = "DATE_TIME_PICKER_PAGE";
const MODIFY_PASSWORD = "MODIFY_PASSWORD";
const ACCOUNT_CANCEL_WIDGET = "ACCOUNT_CANCEL_WIDGET";
const MODIFY_USER_INFO_WIDGET = "MODIFY_USER_INFO_WIDGET";
const CROP_IMAGE_PAGE = "CROP_IMAGE_PAGE";
const ADD_EQUIPMENT_MANUAL = "ADD_EQUIPMENT_MANUAL";

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
      List data = (parameters["serialnumber"] ?? []);
      String serialNum = data.length == 0 ? "" : data.first as String;
      return EquipmentDetail(serialnumber: serialNum,);
    }));

    //设备信息修改
    router.define(EQUIPMENT_INFO_EDIT_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      List data = (parameters["serialnumber"] ?? []);
      String serialNum = data.length == 0 ? "" : data.first as String;
      return EquipmentInfoEditPage(serialnumber: serialNum,);
    }));


    //设备添加
    router.define(EQUIPMENT_ADD_PAGE, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return EquipmentAddPage();
    }));

    router.define(CONSERVE_ENERGY_CONFIG_PAGE,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){

      List data = (parameters["serialnumber"] ?? []);
      String serialNum = data.length == 0 ? "" : data.first as String;
      return ConserveEnergyConfigPage(serialnumber: serialNum,);
    }));

    router.define(CONSERVE_ENERGY_CONFIG_FORM_PAGE,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){

      List data = (parameters["serialnumber"] ?? []);
      String serialNum = data.length == 0 ? "" : data.first as String;
      return ConserveEnergyConfigFormPage(serialnumber: serialNum,);
    }));

    router.define(CHARGE_CONFIG_FORM_PAGE,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      List data = (parameters["serialnumber"] ?? []);
      String serialNum = data.length == 0 ? "" : data.first as String;
      return ChargeConfigFormPage(serialnumber: serialNum,);
    }));

    router.define(DATE_TIME_PICKER_PAGE,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      List data = (parameters["chargeTime"] ?? []);
      String chargeTime = data.length == 0 ? "" : data.first as String;
      print("chargeTime="+chargeTime);
      return DateTimePickerPage(timeCallback: (String value) {
        print("call back value ="+value);
      },chargeTime:chargeTime);
    }));

    router.define(MODIFY_PASSWORD,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      return ModifyPassword();
    }));

    router.define(ACCOUNT_CANCEL_WIDGET,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      return AccountCancelWidget();
    }));

    router.define(MODIFY_USER_INFO_WIDGET,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      return ModifyUserInfoWidget();
    }));

    router.define(ADD_EQUIPMENT_MANUAL,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
      return AddEquipmentManual();
    }));
    // router.define(CROP_IMAGE_PAGE,handler:Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> parameters){
    //   List data = (parameters["originalImage"] ?? []);
    //   String filepath = data.first as String;
    //   return CropImagePage(filePath:filepath);
    // }));

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

  //退出登录
  static Future logOut(BuildContext context,String path){
    return Navigator.of(context).pushNamedAndRemoveUntil(
        LOGIN_PAGE, ModalRoute.withName(LOGIN_PAGE));
  }
  
}