import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/router/router_manager.dart';

class ConserveEnergyConfigFormPage extends StatefulWidget {
   String serialnumber="";
   ConserveEnergyConfigFormPage({Key? key,String serialnumber = ""}) : super(key: key){
    this.serialnumber = serialnumber;
  }

  @override
  State<ConserveEnergyConfigFormPage> createState() => _ConserveEnergyConfigFormPage();
}

class _ConserveEnergyConfigFormPage extends State<ConserveEnergyConfigFormPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String model1;
   int timeSwitch1 = 0;
  late String model1Type;
  late String times1;
  late String model2;
   int timeSwitch2 = 0;
  late String model2Type;
  late String times2;
  late String model3;
   int timeSwitch3  = 0;
  late String model3Type;
  late String times3;
  late String model4;
   int timeSwitch4  = 0;
  late String model4Type;
  late String times4;
  late String model5;
   int timeSwitch5  = 0;
  late String model5Type;
  late String times5;
  late String model6;
   int timeSwitch6  = 0;
  late String model6Type;
  late String times6;
  late String model7;
   int timeSwitch7  = 0;
  late String model7Type;
  late String times7;
  late String model8;
   int timeSwitch8  = 0;
  late String model8Type;
  late String times8;

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
          title: S.of(context).conserve_energy_config,
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
    const SUPPLY_TYPE = ['电池', '市电'];
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
                                          text: "模式1 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '市电',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model1Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times1 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch1==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch1=v!?1:0;
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
                                      text: "模式2 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '电池',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model2Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times2 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch2==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch2=v!?1:0;
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
                                      text: "模式3 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '市电',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model3Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times3 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch3==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch3=v!?1:0;
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
                                      text: "模型4 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '电池',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model4Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times4 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch4==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch4=v!?1:0;
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
                                      text: "模式5 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '市电',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model5Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times5 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch5==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch5=v!?1:0;
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
                                      text: "模式6 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '电池',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model6Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times6 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch6==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch6=v!?1:0;
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
                                      text: "模式7 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '市电',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model7Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times7 = value;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch7==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch7=v!?1:0;
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
                                      text: "模式8 :",
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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(hintText: '供电方式'),
                                // 设置默认值
                                value: '电池',
                                // 选择回调
                                onChanged: (String? newPosition) {
                                  setState(() {
                                    print(newPosition);
                                    model8Type = newPosition!;
                                  });
                                },
                                // 传入可选的数组
                                items: SUPPLY_TYPE.map((String type) {
                                  return DropdownMenuItem(value: type, child: Text(type));
                                }).toList(),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child:  RichText(
                                  text: new TextSpan(
                                      text: "时间:",
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
                                        times8 = value!;
                                      },
                                    )]
                              ),
                              flex: 2,
                            ),

                            Expanded(
                              child: Checkbox(
                                  value: timeSwitch8==1?true:false,
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      this.timeSwitch8=v!?1:0;
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
                        print(times1);
                        print(timeSwitch1);
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
