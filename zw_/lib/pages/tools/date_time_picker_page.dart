import 'package:flutter/material.dart';
import 'package:zw_/router/router_manager.dart';

class DateTimePickerPage extends StatefulWidget {
  String chargeTime="";
  late final ValueChanged<String> timeCallback;

  DateTimePickerPage({required this.timeCallback,  String chargeTime="",Key? key}) : super(key: key){
    this.chargeTime=chargeTime;
  }

   @override
    State<DateTimePickerPage> createState() => _DateTimePickerPage();
  }

  class _DateTimePickerPage extends State<DateTimePickerPage> {
    final _hours = List.generate(24, (i) => i.timeFormat);

    final _minutes = List.generate(60, (i) => i.timeFormat);

    var _hourViewIndex = 0;

    var _minuteViewIndex = 0;

    late FixedExtentScrollController _hourController;

    late FixedExtentScrollController _minuteController;

    @override
    void initState() {
      super.initState();
      print("chargeTime = "+widget.chargeTime);
      _nowTimeSetting(widget.chargeTime);
    }

    @override
    Widget build(BuildContext context) {
      return Container(
          child: Stack(
            children: [
              Row(
                children: [
                  _hourView(),
                  _minuteView(),
                ],
              ),
              Positioned(
                left: 16,
                right: 16,
                top: 68,
                child: Divider(),
              ),
              Positioned(
                left: 16,
                right: 16,
                top: 118,
                child: Divider(),
              ),
            ],
          ),
        );
    }

      Widget _hourView() {
        return _timeWheel(times: _hours, isHour: true, controller: _hourController);
      }

      Widget _minuteView() {
        return _timeWheel(times: _minutes, isHour: false, controller: _minuteController);
      }

      Widget _timeWheel({required List<String> times, required bool isHour, required FixedExtentScrollController controller}) {
        return Flexible(
          child: Container(
            height: 300,
            child: ListWheelScrollView.useDelegate(
              controller: controller,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: times.map(
                (number) => _buildItem(number),
                ).toList(),
              ),
              perspective: 0.006,
              itemExtent: 49,
              /// 是否放大
              useMagnifier: true,
              /// 放大倍数
              magnification: 1.2,
              onSelectedItemChanged: (index) {
                if (isHour) {
                _hourViewIndex = index;
                } else {
                _minuteViewIndex = index;
                }
                final time = _hours[_hourViewIndex] + ":" + _minutes[_minuteViewIndex];
                print(time.toString());
                widget.timeCallback(time);
                RouterManager.goBackWithParam(context,time);
                // Navigator.pop(context);
              },
              ),
            ),
          );
      }

      Widget _buildItem(String time) {
        return Container(
          key: ValueKey(time),
          alignment: Alignment.center,
          height: 50,
          color: Color(0xFF8080),
          child: Text(
            time,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.white,
            ),
          ),
        );
      }

    void _nowTimeSetting(String chargeTime) {
        var nowHour = "";
        var nowMinute = "";

        if(chargeTime.isNotEmpty){
           var times =  chargeTime.split(":");
           nowHour =  times[0];
           nowMinute = times[1];
        }else{
          final nowTime = DateTime.now();
          nowHour = nowTime.hour.timeFormat;
          nowMinute = nowTime.minute.timeFormat;
        }
        _hourViewIndex = _hours.indexOf(nowHour);
        _minuteViewIndex = _minutes.indexOf(nowMinute);
        _hourController = FixedExtentScrollController(initialItem: _hourViewIndex);
        _minuteController = FixedExtentScrollController(initialItem: _minuteViewIndex);
    }

    @override
    void dispose() {
      _hourController.dispose();
      _minuteController.dispose();
      super.dispose();
      }
    }

    extension on int {
      String get timeFormat {
      var string = this.toString();
      return string.length == 2 ? string : "0" + string;
      }
    }