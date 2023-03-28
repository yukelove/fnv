import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/api/api.dart';
import 'package:zw_/constant/constant_declare.dart';
import 'package:zw_/utils/local_cache.dart';

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
  TextEditingController times9Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    times9Controller.text="0000";
  }

  late String model9;
  late bool timeSwitch9 = false;
  late String model1Type;
  late String times9;
  late String model10;
  late bool timeSwitch10 = false;
  late String model2Type;
  late String times10;
  late String model3;
  late bool timeSwitch11 = false;
  late String model3Type;
  late String times11;
  late String model4;
  late bool timeSwitch12 = false;
  late String model4Type;
  late String times12;
  late String model5;
  late bool timeSwitch13 = false ;
  late String model5Type;
  late String times13;
  late String model6;
  late bool timeSwitch14 = false ;
  late String model6Type;
  late String times14;
  late String model7;
  late bool timeSwitch15 = false;
  late String model7Type;
  late String times15;
  late String model8;
  late bool timeSwitch16 = false ;
  late String model8Type;
  late String times16;

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

  Container _body() {
    return Container(
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
                                      decoration: InputDecoration(hintText: '  hhmm  '),
                                      controller: times9Controller,
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times9 = value!;
                                      },
                                    ),
                                  ]
                              ),
                              flex: 2,
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times9 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch9,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch9=v!;
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times10 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times10 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch10,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch10=v!;
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times11 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times11 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch11,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch11=v!;
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times12 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
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
                                      validator: (value) {
                                        RegExp reg = new RegExp(r'^\d{4}$'); //匹配手机号是否为11位
                                        if (!reg.hasMatch(value!)) {
                                          return '格式错误';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        print('time onChanged');
                                        times12 = value!;
                                      },
                                    )

                                  ]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch12,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch12=v!;
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
              Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print('提交成功');
                        //提交表单
                        print('_formkey.currentState!.save() - Before');
                        _formkey.currentState!.save();
                        print('_formkey.currentState!.save() - After');
                        print(times9);
                        print(timeSwitch9);
                      }
                    },
                    child: Text('提交'),
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _formkey.currentState!.reset();
                    },
                    child: Text('重置'),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
