import 'package:flutter/material.dart';

// 引入第三方插件
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() => runApp(MaterialApp(
  home: DatePickerPage(),
));

class DatePickerPage extends StatefulWidget {
  DatePickerPage({ Key? key}) : super(key: key);
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  DateTime _dateTime=DateTime.now();

  // 显示时间的方法
  void _showDatePicker(){

    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,

      // 如果报错提到 DateTimePickerTheme 有问题，点开这个类的原文件作如下修改。
      // 移除'with DiagnosticableMixin'或者将'DiagnosticableMixin'改成'Diagnosticable'.
      pickerTheme: DateTimePickerTheme(
          showTitle: true,
          confirm: Text('确认', style: TextStyle(color: Colors.red)),
          cancel: Text('取消',style:TextStyle(color:Colors.cyan))
      ),

      minDateTime: DateTime.parse("1970-01-01"),
      maxDateTime: DateTime.parse("2050-01-01"),

      initialDateTime: _dateTime,

      // 显示日期
      // dateFormat: "yyyy-MMMM-dd",

      // 显示日期与时间
      dateFormat:'yyyy年M月d日    EEE,H时:m分',  // show TimePicker
      pickerMode: DateTimePickerMode.datetime,  // show TimePicker


      locale: DateTimePickerLocale.zh_cn,

      onChange: (dateTime, List<int> index) {
        setState(() {
          // 初始及修改保存后的时间
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          // 初始及修改保存后的时间
          _dateTime = dateTime;
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("时间选择器")),
        body:Center(
          // 添加点击水波纹效果
          child: InkWell(
              child:Text("${formatDate(_dateTime,[yyyy,'年',mm,'月',dd,' ',HH,':',nn])}"),
              onTap:_showDatePicker
          ),
        )
    );
  }
}
