import 'dart:developer';

class ZWLogUtil {
  static var _separator = "=";
  static var _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "ZW_Log";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "$_split$_title$_split";

  static void init(
      {required String title,
      required bool isDebug,
      required int limitLength}) {
    _title = title;
    _isDebug = isDebug;
    _limitLength = limitLength;
    _startLine = "$_split$_title$_split";
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      //系统模式
      log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void error(String obj) {
    segmentationLog(obj);
  }

  static void _log(String msg) {
    _logEmpyLine();
    if (msg.length < _limitLength) {
      log(msg);
    } else {
      segmentationLog(msg);
    }
    _logEmpyLine();
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          var remainderStr = msg.substring(lastIndex, msg.length);
          log(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine() {
    print("");
  }
}