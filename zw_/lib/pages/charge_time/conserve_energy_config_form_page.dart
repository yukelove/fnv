import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:zw_/generated/l10n.dart';
import 'package:zw_/components/app_bar.dart';
import 'package:zw_/pages/charge_time/networking/conserve_energy_config_networking.dart';
import 'package:zw_/utils/zw_hud.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/pages/charge_time/state/conserve_energy_config_model.dart';

import '../tools/fnv_tools.dart';

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
  TextEditingController times1Ctr = TextEditingController();
  TextEditingController timesSwitch1Ctr = TextEditingController();
  TextEditingController times2Ctr = TextEditingController();
  TextEditingController timesSwitch2Ctr = TextEditingController();
  TextEditingController times3Ctr = TextEditingController();
  TextEditingController timesSwitch3Ctr = TextEditingController();
  TextEditingController times4Ctr = TextEditingController();
  TextEditingController timesSwitch4Ctr = TextEditingController();
  TextEditingController times5Ctr = TextEditingController();
  TextEditingController timesSwitch5Ctr = TextEditingController();
  TextEditingController times6Ctr = TextEditingController();
  TextEditingController timesSwitch6Ctr = TextEditingController();
  TextEditingController times7Ctr = TextEditingController();
  TextEditingController timesSwitch7Ctr = TextEditingController();
  TextEditingController times8Ctr = TextEditingController();
  TextEditingController timesSwitch8Ctr = TextEditingController();

  late String serialnumber="";
  // late String model1;
   int timeSwitch1 = 0;
  late String model1Type;
  late String times1;
  // late String model2;
   int timeSwitch2 = 0;
  late String model2Type;
  late String times2;
  // late String model3;
   int timeSwitch3  = 0;
  late String model3Type;
  late String times3;
  // late String model4;
   int timeSwitch4  = 0;
  late String model4Type;
  late String times4;
  // late String model5;
   int timeSwitch5  = 0;
  late String model5Type;
  late String times5;
  // late String model6;
   int timeSwitch6  = 0;
  late String model6Type;
  late String times6;
  // late String model7;
   int timeSwitch7  = 0;
  late String model7Type;
  late String times7;
  // late String model8;
   int timeSwitch8  = 0;
  late String model8Type;
  late String times8;
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

  late ConserveEnergyConfigModel conserveEnergyConfigModel = new ConserveEnergyConfigModel(serialnumber: serialnumber, timeSwitch1: timeSwitch1, times1: times1, timeSwitch2: timeSwitch2, times2: times2, timeSwitch3: timeSwitch3, times3: times3, timeSwitch4: timeSwitch4, times4: times4, timeSwitch5: timeSwitch5, times5: times5, timeSwitch6: timeSwitch6, times6: times6, timeSwitch7: timeSwitch7, times7: times7, timeSwitch8: timeSwitch8, times8: times8, timeSwitch9: timeSwitch9, times9: times9, timeSwitch10: timeSwitch10, times10: times10, timeSwitch11: timeSwitch11, times11: times11, timeSwitch12: timeSwitch12, times12: times12, timeSwitch13: timeSwitch13, times13: times13, timeSwitch14: timeSwitch14, times14: times14, timeSwitch15: timeSwitch15, times15: times15, timeSwitch16: timeSwitch16, times16: times16);

  @override
  void initState(){
    super.initState();
    ConserveEnergyConfigNetworking.timeConfigQuery(widget.serialnumber).then((value){
      conserveEnergyConfigModel = ConserveEnergyConfigModel.fromJson(value);
      setState(() {
        this.times1Ctr.text = addStr(conserveEnergyConfigModel.times1,":");
        this.timeSwitch1 = conserveEnergyConfigModel.timeSwitch1;
        this.times2Ctr.text = addStr(conserveEnergyConfigModel.times2,":");
        this.timeSwitch2 = conserveEnergyConfigModel.timeSwitch2;
        this.times3Ctr.text = addStr(conserveEnergyConfigModel.times3,":");
        this.timeSwitch3 = conserveEnergyConfigModel.timeSwitch3;
        this.times4Ctr.text = addStr(conserveEnergyConfigModel.times4,":");
        this.timeSwitch4 = conserveEnergyConfigModel.timeSwitch4;
        this.times5Ctr.text = addStr(conserveEnergyConfigModel.times5,":");
        this.timeSwitch5 = conserveEnergyConfigModel.timeSwitch5;
        this.times6Ctr.text = addStr(conserveEnergyConfigModel.times6,":");
        this.timeSwitch6 = conserveEnergyConfigModel.timeSwitch6;
        this.times7Ctr.text = addStr(conserveEnergyConfigModel.times7,":");
        this.timeSwitch7 = conserveEnergyConfigModel.timeSwitch7;
        this.times8Ctr.text = addStr(conserveEnergyConfigModel.times8,":");
        this.timeSwitch8 = conserveEnergyConfigModel.timeSwitch8;
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

  SingleChildScrollView _body() {
    const SUPPLY_TYPE = ['电池', '市电'];
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times1Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          conserveEnergyConfigModel.times1 = replaceStr(value,":","");
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
                                        initialDateTime: DateTime.parse("2023-01-01 "+times1Ctr.text),
                                        dateFormat: "HH:mm",// show TimePicker
                                        onConfirm: (dateTime, List<int> index) {
                                          setState(() {
                                            // 初始及修改保存后的时间
                                            int hour  = dateTime.hour;
                                            int mini  = dateTime.minute;
                                            times1Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                            conserveEnergyConfigModel.times1=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch1==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch1=v!?1:0;
                                        this.timeSwitch1=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times2Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time onChanged');
                                          conserveEnergyConfigModel.times2 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times2Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times2Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times2=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch2==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch2=v!?1:0;
                                        this.timeSwitch2=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times3Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('times3 onChanged');
                                          conserveEnergyConfigModel.times3 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times3Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times3Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times3=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch3==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch3=v!?1:0;
                                        this.timeSwitch3=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times4Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time onChanged');
                                          conserveEnergyConfigModel.times4 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times4Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times4Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times4=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch4==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch4=v!?1:0;
                                        this.timeSwitch4=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times5Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('times5 onChanged');
                                          conserveEnergyConfigModel.times5 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times5Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times5Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times5=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch5==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch5=v!?1:0;
                                        this.timeSwitch5=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times6Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time onChanged');
                                          conserveEnergyConfigModel.times6 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times6Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times6Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times6=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch6==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch6=v!?1:0;
                                        this.timeSwitch6=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times7Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$'); //匹配手机号是否为11位
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time onChanged');
                                          conserveEnergyConfigModel.times7 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times7Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times7Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times7=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch7==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch7=v!?1:0;
                                        this.timeSwitch7=v!?1:0;
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
                                        readOnly:true,
                                        decoration: InputDecoration(hintText: '  hhmm  '),
                                        controller: times8Ctr,
                                        validator: (value) {
                                          RegExp reg = new RegExp(r'^\d{2}\:\d{2}$');
                                          if (!reg.hasMatch(value!)) {
                                            return '格式错误';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          print('time onChanged');
                                          conserveEnergyConfigModel.times8 = replaceStr(value,":","");
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
                                          initialDateTime: DateTime.parse("2023-01-01 "+times8Ctr.text),
                                          dateFormat: "HH:mm",// show TimePicker
                                          onConfirm: (dateTime, List<int> index) {
                                            setState(() {
                                              // 初始及修改保存后的时间
                                              int hour  = dateTime.hour;
                                              int mini  = dateTime.minute;
                                              times8Ctr.text=FnvTools.strRepair(hour,mini,-1,":");
                                              conserveEnergyConfigModel.times8=FnvTools.strRepair(hour,mini,-1,"");
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
                                    value: timeSwitch8==1?true:false,
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        this.conserveEnergyConfigModel.timeSwitch8=v!?1:0;
                                        this.timeSwitch8=v!?1:0;
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
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print('提交成功');
                          //提交表单
                          print('timeConfigSave - Before');
                          ConserveEnergyConfigNetworking.timeConfigSave(conserveEnergyConfigModel);
                          print('timeConfigSave - After');
                          setState(() {
                          });
                          print(times1);
                          print(timeSwitch1);
                        }
                      },
                      child: Text('提交'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color:Color(0xff4c505b))),
                    )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _formkey.currentState!.reset();
                        setState(() {
                        });
                      },
                      child: Text('重置'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color:Color(0xff4c505b))),
                    )
                )
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
      ConserveEnergyConfigNetworking.timeConfigSave(conserveEnergyConfigModel);
    }
  }

  String addStr(String targetStr,String addStr){
    String strPrefix  =  targetStr.substring(0,2);
    String strSuffix  =  targetStr.substring(2);
    return strPrefix+addStr+strSuffix;
  }

  String replaceStr(String sourceStr,String fromStr,String toStr){
    return  sourceStr.replaceAll(fromStr, toStr);
  }
}
