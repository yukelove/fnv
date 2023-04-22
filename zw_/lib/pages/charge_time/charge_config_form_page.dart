import 'dart:convert';
import 'package:flutter/material.dart';
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
      times9Ctr.text = addStr(chargeConfigModel.times9,":");
      timeSwitch10 = chargeConfigModel.timeSwitch10;
      // times10      = value['times10'].toString();
      times10Ctr.text = addStr(chargeConfigModel.times10,":");
      timeSwitch11 = chargeConfigModel.timeSwitch11;
      // times11      = value['times11'].toString();
      times11Ctr.text = addStr(chargeConfigModel.times11,":");
      timeSwitch12 = chargeConfigModel.timeSwitch12;
      // times12      = value['times12'].toString();
      times12Ctr.text = addStr(chargeConfigModel.times12,":");
      timeSwitch13 = chargeConfigModel.timeSwitch13;
      // times13      = value['times13'].toString();
      times13Ctr.text = addStr(chargeConfigModel.times13,":");
      timeSwitch14 = chargeConfigModel.timeSwitch14;
      // times14      = value['times14'].toString();
      times14Ctr.text = addStr(chargeConfigModel.times14,":");
      // timeSwitch15 = chargeConfigModel.timeSwitch15;
      // times15      = value['times15'].toString();
      times15Ctr.text = addStr(chargeConfigModel.times15,":");
      // timeSwitch16 = chargeConfigModel.timeSwitch16;
      // times16      = value['times16'].toString();
      times16Ctr.text = addStr(chargeConfigModel.times16,":");
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
                                          chargeConfigModel.times9 = this.replaceStr(value, ":");
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
                                    String path = "${DATE_TIME_PICKER_PAGE}";
                                    RouterManager.jump(context, path);
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times10Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time10 onChanged');
                                          chargeConfigModel.times10 = this.replaceStr(value, ":");
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
                                  String path = "${DATE_TIME_PICKER_PAGE}";
                                  RouterManager.jump(context, path);
                                },
                              )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: timeSwitch9==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch9=v!?1:0;
                                        this.timeSwitch9=v!?1:0;
                                        this.chargeConfigModel.timeSwitch10=v!?1:0;
                                        this.timeSwitch10=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.blue,
                                    checkColor:Colors.white
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times11Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time11 onChanged');
                                          chargeConfigModel.times11 = this.replaceStr(value, ":");
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
                                    String path = "${DATE_TIME_PICKER_PAGE}";
                                    RouterManager.jump(context, path);
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times12Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time12 onChanged');
                                          chargeConfigModel.times12 = this.replaceStr(value, ":");
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
                                    String path = "${DATE_TIME_PICKER_PAGE}";
                                    RouterManager.jump(context, path);
                                  },
                                )
                              ),
                              Expanded(
                                child: Checkbox(
                                    value: timeSwitch11==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.chargeConfigModel.timeSwitch11=v!?1:0;
                                        this.timeSwitch11=v!?1:0;
                                        this.chargeConfigModel.timeSwitch12=v!?1:0;
                                        this.timeSwitch12=v!?1:0;
                                      });
                                    },
                                    activeColor: Colors.blue,
                                    checkColor:Colors.white
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times13Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time13 onChanged');
                                          chargeConfigModel.times13 = this.replaceStr(value, ":");
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
                                    String path = "${DATE_TIME_PICKER_PAGE}";
                                    RouterManager.jump(context, path);
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times14Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time14 onChanged');
                                          chargeConfigModel.times14 = this.replaceStr(value, ":");
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
                                    String path = "${DATE_TIME_PICKER_PAGE}";
                                    RouterManager.jump(context, path);
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
                                    activeColor: Colors.blue,
                                    checkColor:Colors.white
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times15Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time15 onChanged');
                                          print(this.replaceStr(value, ":"));
                                          chargeConfigModel.times15 = this.replaceStr(value, ":");
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
                                  String path = "${DATE_TIME_PICKER_PAGE}";
                                  RouterManager.jump(context, path);
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
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times16Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time16 onChanged');
                                          chargeConfigModel.times16 = this.replaceStr(value, ":");
                                        },
                                      )

                                    ]
                                ),
                                flex: 2,
                              ),
                              Expanded(child:
                              IconButton(
                                icon: Icon(Icons.access_time),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  String path = "${DATE_TIME_PICKER_PAGE}";
                                  RouterManager.jump(context, path);
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
                                    activeColor: Colors.blue,
                                    checkColor:Colors.white
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
                      child: Text('提交'),
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

  String addStr(String targetStr,String addStr){
    String strPrefix  =  targetStr.substring(0,2);
    String strSuffix  =  targetStr.substring(2);
    return strPrefix+addStr+strSuffix;
  }

  String replaceStr(String targetStr,String replaceStr){
    return  targetStr.replaceAll(":", "");
  }

}
