import 'dart:convert';
import 'package:zw_/pages/tools/fnv_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/api/api.dart';
import 'package:zw_/constant/constant_declare.dart';
import 'package:zw_/utils/local_cache.dart';
import 'package:zw_/pages/charge_time/networking/charge_config_networking.dart';
import 'package:zw_/pages/charge_time/state/charge_config_model.dart';

class ChargeConfigFormPage extends StatefulWidget {
   String serialnumber="";
   ChargeConfigFormPage({Key? key,String serialnumber = ""}) : super(key: key){
    this.serialnumber = serialnumber;
  }

  @override
  State<ChargeConfigFormPage> createState() => _ChargeConfigFormPage();
}

class _ChargeConfigFormPage extends State<ChargeConfigFormPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController times9Ctr = TextEditingController();
  TextEditingController timesSwitch9Ctr = TextEditingController();
  TextEditingController times10Ctr = TextEditingController();
  TextEditingController timesSwitch10Ctr = TextEditingController();
  TextEditingController times11Ctr = TextEditingController();
  TextEditingController timesSwitch11Ctr = TextEditingController();
  TextEditingController times12Ctr = TextEditingController();
  TextEditingController timesSwitch12Ctr = TextEditingController();
  TextEditingController times13Ctr = TextEditingController();
  TextEditingController timesSwitch13Ctr = TextEditingController();
  TextEditingController times14Ctr = TextEditingController();
  TextEditingController timesSwitch14Ctr = TextEditingController();
  TextEditingController times15Ctr = TextEditingController();
  TextEditingController times15witch9Ctr = TextEditingController();
  TextEditingController times16Ctr = TextEditingController();
  TextEditingController timesSwitch16Ctr = TextEditingController();

  late String serialnumber="";
  // late String model1;
  int timeSwitch1 = 0;
  // late String model1Type;
  late String times1="";
  // late String model2;
  int timeSwitch2 = 0;
  // late String model2Type;
  late String times2="";
  // late String model3;
  int timeSwitch3  = 0;
  // late String model3Type;
  late String times3="";
  // late String model4;
  int timeSwitch4  = 0;
  // late String model4Type;
  late String times4="";
  // late String model5;
  int timeSwitch5  = 0;
  // late String model5Type;
  late String times5="";
  // late String model6;
  int timeSwitch6  = 0;
  // late String model6Type;
  late String times6="";
  // late String model7;
  int timeSwitch7  = 0;
  // late String model7Type;
  late String times7="";
  // late String model8;
  int timeSwitch8  = 0;
  // late String model8Type;
  late String times8="";
  // late String model9;
  late int timeSwitch9=0;
  // late String model1Type;
  late String times9="";
  // late String model10;
  late int timeSwitch10=0;
  // late String model2Type;
  late String times10="";
  // late String model11;
  late int timeSwitch11=0;
  // late String model3Type;
  late String times11="";
  // late String model12;
  late int timeSwitch12=0;
  // late String model12Type;
  late String times12="";
  // late String model13;
  late int timeSwitch13=0;
  // late String model5Type;
  late String times13="";
  // late String model14;
  late int timeSwitch14=0;
  // late String model6Type;
  late String times14="";
  // late String model15;
  late int timeSwitch15=0;
  // late String model7Type;
  late String times15="";
  // late String model16;
  late int timeSwitch16=0;
  // late String model8Type;
  late String times16="";

   late ChargeConfigModel chargeConfigModel =  new ChargeConfigModel(serialnumber: serialnumber, timeSwitch1: timeSwitch1, times1: times1, timeSwitch2: timeSwitch2, times2: times2, timeSwitch3: timeSwitch3, times3: times3, timeSwitch4: timeSwitch4, times4: times4, timeSwitch5: timeSwitch5, times5: times5, timeSwitch6: timeSwitch6, times6: times6, timeSwitch7: timeSwitch7, times7: times7, timeSwitch8: timeSwitch8, times8: times8, timeSwitch9: timeSwitch9, times9: times9, timeSwitch10: timeSwitch10, times10: times10, timeSwitch11: timeSwitch11, times11: times11, timeSwitch12: timeSwitch12, times12: times12, timeSwitch13: timeSwitch13, times13: times13, timeSwitch14: timeSwitch14, times14: times14, timeSwitch15: timeSwitch15, times15: times15, timeSwitch16: timeSwitch16, times16: times16);
  // = new ChargeConfigModel(serialnumber: serialnumber, timeSwitch1: timeSwitch1, times1: times1, timeSwitch2: timeSwitch2, times2: times2, timeSwitch3: timeSwitch3, times3: times3, timeSwitch4: timeSwitch4, times4: times4, timeSwitch5: timeSwitch5, times5: times5, timeSwitch6: timeSwitch6, times6: times6, timeSwitch7: timeSwitch7, times7: times7, timeSwitch8: timeSwitch8, times8: times8, timeSwitch9: timeSwitch9, times9: times9, timeSwitch10: timeSwitch10, times10: times10, timeSwitch11: timeSwitch11, times11: times11, timeSwitch12: timeSwitch12, times12: times12, timeSwitch13: timeSwitch13, times13: times13, timeSwitch14: timeSwitch14, times14: times14, timeSwitch15: timeSwitch15, times15: times15, timeSwitch16: timeSwitch16, times16: times16);

  @override
  void initState() {
    super.initState();
    ChargeConfigNetworking.timeConfigQuery(widget.serialnumber).then((value){

      chargeConfigModel= ChargeConfigModel.fromJson(value);
      setState((){

      // serialnumber = chargeConfigModel.serialnumber;
      timeSwitch9  = chargeConfigModel.timeSwitch9;
      // times9       = value['times9'].toString();
      times9Ctr.text = FnvTools.addStr(chargeConfigModel.times9,":");
      timeSwitch10 = chargeConfigModel.timeSwitch10;
      // times10      = value['times10'].toString();
      times10Ctr.text = FnvTools.addStr(chargeConfigModel.times10,":");
      timeSwitch11 = chargeConfigModel.timeSwitch11;
      // times11      = value['times11'].toString();
      times11Ctr.text = FnvTools.addStr(chargeConfigModel.times11,":");
      timeSwitch12 = chargeConfigModel.timeSwitch12;
      // times12      = value['times12'].toString();
      times12Ctr.text = FnvTools.addStr(chargeConfigModel.times12,":");
      timeSwitch13 = chargeConfigModel.timeSwitch13;
      // times13      = value['times13'].toString();
      times13Ctr.text = FnvTools.addStr(chargeConfigModel.times13,":");
      timeSwitch14 = chargeConfigModel.timeSwitch14;
      // times14      = value['times14'].toString();
      times14Ctr.text = FnvTools.addStr(chargeConfigModel.times14,":");
      // timeSwitch15 = chargeConfigModel.timeSwitch15;
      // times15      = value['times15'].toString();
      times15Ctr.text = FnvTools.addStr(chargeConfigModel.times15,":");
      // timeSwitch16 = chargeConfigModel.timeSwitch16;
      // times16      = value['times16'].toString();
      times16Ctr.text = FnvTools.addStr(chargeConfigModel.times16,":");
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  PreferredSize _appBar(){
       return PreferredSize(
        child: CustomAppBar(
          title: S.of(context).charge_config,
          actionIcon: "",
          leadingCallBack: () {
            RouterManager.goBack(context);
          },
          actionCallBack: () {},
        ),
        preferredSize: Size.fromHeight(60),
      );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
                key: _formkey,
                child: Container(
                    child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child:  RichText(
                                      text: new TextSpan(
                                            text: "充电1 :",
                                            style: TextStyle(
                                               color: Colors.black,
                                               fontSize: 16.0,
                                                //字体加粗
                                               fontWeight: FontWeight.w700
                                             )
                                )),
                                flex: 2,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(
                                            hintText: '  hhmm  ',
                                        ),
                                        controller: times9Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time9 onChanged');
                                          chargeConfigModel.times9 = FnvTools.replaceStr(value, ":");
                                        }
                                      ),
                                    ]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                                IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      pickerMode: DateTimePickerMode.time,
                                      initialDateTime: DateTime.parse("2023-01-01 "+times9Ctr.text),
                                      dateFormat: "HH:mm",// show TimePicker
                                      onConfirm: (dateTime, List<int> index) {
                                        setState(() {
                                          // 初始及修改保存后的时间
                                          int hour  = dateTime.hour;
                                          int mini  = dateTime.minute;
                                          print("选择时间："+dateTime.toString());
                                          times9Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                          chargeConfigModel.times9=FnvTools.strRepair(hour,mini,-1,"");
                                        });
                                      }
                                    );
                                    // String path = "${DATE_TIME_PICKER_PAGE}?chargeTime=${times9Ctr.text}";
                                    // RouterManager.jump(context, path).then((value){
                                    //   print("call back");
                                    //   print("value="+value.toString());
                                    // });
                                  },
                                )
                              ),
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "   -",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times10Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time10 onChanged');
                                          chargeConfigModel.times10 = FnvTools.replaceStr(value, ":");
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                  child: IconButton(
                                icon: Icon(Icons.access_time),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                      context,
                                      pickerMode: DateTimePickerMode.time,
                                      initialDateTime: DateTime.parse("2023-01-01 "+times10Ctr.text),
                                      dateFormat: "HH:mm",// show TimePicker
                                      onConfirm: (dateTime, List<int> index) {
                                        setState(() {
                                          // 初始及修改保存后的时间
                                          int hour  = dateTime.hour;
                                          int mini  = dateTime.minute;
                                          print("选择时间："+dateTime.toString());
                                          times10Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                          chargeConfigModel.times10=FnvTools.strRepair(hour,mini,-1,"");
                                        });
                                      }
                                  );

                                  // String path = "${DATE_TIME_PICKER_PAGE}";
                                  // RouterManager.jump(context, path);
                                },
                              )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: timeSwitch9==1?true:false,
                                    onChanged: (v) {
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch9=v!?1:0;
                                        this.timeSwitch9=v!?1:0;
                                        this.chargeConfigModel.timeSwitch10=v!?1:0;
                                        this.timeSwitch10=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    checkColor:Colors.black
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "充电2 :",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 2,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times11Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time11 onChanged');
                                          chargeConfigModel.times11 = FnvTools.replaceStr(value, ":");
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                                IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                        context,
                                        pickerMode: DateTimePickerMode.time,
                                        initialDateTime: DateTime.parse("2023-01-01 "+times11Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times11Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            chargeConfigModel.times11=FnvTools.strRepair(hour,mini,-1,"");
                                          });
                                        }
                                    );
                                    // String path = "${DATE_TIME_PICKER_PAGE}";
                                    // RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "   -",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times12Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time12 onChanged');
                                          chargeConfigModel.times12 = FnvTools.replaceStr(value, ":");
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                                IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                        context,
                                        pickerMode: DateTimePickerMode.time,
                                        initialDateTime: DateTime.parse("2023-01-01 "+times12Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times12Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            chargeConfigModel.times12=FnvTools.strRepair(hour,mini,-1,"");
                                          });
                                        }
                                    );
                                    // String path = "${DATE_TIME_PICKER_PAGE}";
                                    // RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: timeSwitch11==1?true:false,
                                    onChanged: (v) {
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch11=v!?1:0;
                                        this.timeSwitch11=v!?1:0;
                                        this.chargeConfigModel.timeSwitch12=v!?1:0;
                                        this.timeSwitch12=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    checkColor:Colors.black
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "充电3 :",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 2,
                              ),

                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times13Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time13 onChanged');
                                          chargeConfigModel.times13 = FnvTools.replaceStr(value, ":");
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                                IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                        context,
                                        pickerMode: DateTimePickerMode.time,
                                        initialDateTime: DateTime.parse("2023-01-01 "+times13Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times13Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            chargeConfigModel.times13=FnvTools.strRepair(hour,mini,-1,"");
                                          });
                                        }
                                    );
                                    // String path = "${DATE_TIME_PICKER_PAGE}";
                                    // RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "   -",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times14Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time14 onChanged');
                                          chargeConfigModel.times14 = FnvTools.replaceStr(value, ":");
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                                IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                        context,
                                        pickerMode: DateTimePickerMode.time,
                                        initialDateTime: DateTime.parse("2023-01-01 "+times14Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times14Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            chargeConfigModel.times14=FnvTools.strRepair(hour,mini,-1,"");
                                          });
                                        }
                                    );
                                    // String path = "${DATE_TIME_PICKER_PAGE}";
                                    // RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: timeSwitch13==1?true:false,
                                    onChanged: (v) {
                                      print("timeSwitch13="+v.toString());
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch13=v!?1:0;
                                        this.timeSwitch13=v!?1:0;
                                        this.chargeConfigModel.timeSwitch14=v!?1:0;
                                        this.timeSwitch14=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    checkColor:Colors.black
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "充电4 :",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700
                                        )
                                    )),
                                flex: 2,
                              ),

                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times15Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time15 onChanged');
                                          chargeConfigModel.times15 = FnvTools.replaceStr(value, ":");
                                          print(chargeConfigModel.times15);
                                        },
                                      )]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                              IconButton(
                                icon: Icon(Icons.access_time),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                      context,
                                      pickerMode: DateTimePickerMode.time,
                                      initialDateTime: DateTime.parse("2023-01-01 "+times15Ctr.text),
                                      dateFormat: "HH:mm",// show TimePicker
                                      onConfirm: (dateTime, List<int> index) {
                                        setState(() {
                                          // 初始及修改保存后的时间
                                          int hour  = dateTime.hour;
                                          int mini  = dateTime.minute;
                                          print("选择时间："+dateTime.toString());
                                          times15Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                          chargeConfigModel.times15=FnvTools.strRepair(hour,mini,-1,"");
                                        });
                                      }
                                  );

                                  // String path = "${DATE_TIME_PICKER_PAGE}";
                                  // RouterManager.jump(context, path);
                                },
                              )
                              ),
                              Expanded(
                                child:  RichText(
                                    text: new TextSpan(
                                        text: "   -",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //字体加粗
                                            fontWeight: FontWeight.w700,
                                        )
                                    )),
                                flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                    children: [
                                      TextFormField(
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times16Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time16 onChanged');
                                          chargeConfigModel.times16 = FnvTools.replaceStr(value, ":");
                                        },
                                      )

                                    ]
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child:IconButton(
                                  icon: Icon(Icons.access_time),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                        context,
                                        pickerMode: DateTimePickerMode.time,
                                        initialDateTime: DateTime.parse("2023-01-01 "+times16Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times16Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            chargeConfigModel.times16=FnvTools.strRepair(hour,mini,-1,"");
                                          });
                                        }
                                    );

                                    // String path = "${DATE_TIME_PICKER_PAGE}";
                                    // RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: this.chargeConfigModel.timeSwitch15==1?true:false,
                                    onChanged: (v) {
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch15=v!?1:0;
                                        this.chargeConfigModel.timeSwitch16=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    checkColor:Colors.black
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ])
                )
            ),
            Row(
              children: [
                Expanded(  child:Container( height: 80.0,),),
                Expanded(  child:Divider(height: 0,thickness: 1,indent:0,endIndent:0, color: Colors.black,),),
                Expanded(  child:Container( height: 5, ),
                ),
              ]
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print('提交成功');
                          //提交表单
                          print('timeConfigSave - Before');
                          ChargeConfigNetworking.timeConfigSave(chargeConfigModel);
                          print('timeConfigSave - After');
                          setState(() {
                          });
                        }
                      },
                      child: Text(S.current.commit_button),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color:Color(0xff4c505b))),
                    )
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _formkey.currentState!.reset();
                        setState(() {
                        });
                        // this.initState();
                      },
                      child: Text('重置'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color:Color(0xff4c505b))),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void saveChargeConfigInfo(BuildContext context) async {
    var f = _formkey.currentState;
     if(f!=null && f.validate()){
       ChargeConfigNetworking.timeConfigSave(chargeConfigModel);
     }
  }

  // String addStr(String targetStr,String addStr){
  //   String strPrefix  =  targetStr.substring(0,2);
  //   String strSuffix  =  targetStr.substring(2);
  //   return strPrefix+addStr+strSuffix;
  // }
  //
  // String replaceStr(String targetStr,String replaceStr){
  //   return  targetStr.replaceAll(":", "");
  // }
  //
  // String strRepair(int hour, int mini, int sec,String splitStr) {
  //   if(hour.isNaN || mini.isNaN || hour<0 || mini<0){
  //     return "00"+splitStr+"00";
  //   }else{
  //     String hourStr  = hour.bitLength==2?hour.toString():"0"+hour.toString();
  //     String miniStr  = mini.bitLength==2?mini.toString():"0"+mini.toString();
  //     if(sec.isNaN || sec<0){
  //       return hourStr+splitStr+miniStr;
  //     }else{
  //       String secStr  = sec.bitLength==2?sec.toString():"0"+sec.toString();
  //       return hourStr+splitStr+miniStr+splitStr+secStr;
  //     }
  //   }
  // }

}
