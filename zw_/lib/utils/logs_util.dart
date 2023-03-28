
class LogsUtil {
  /// 黑色 Black
  static const String verboseColor = '\x1b[30m';

  /// 蓝色 Blue
  static const String debugColor = '\x1b[34m';

  /// 绿色 Green
  static const String infoColor = '\x1b[32m';

  /// 橙色(暂时用黄色 Light yellow)
  static const String warningColor = '\x1b[93m';

  /// 红色 Light red
  static const String errorColor = '\x1b[91m';

  /// 白色 White
  static const String defaultColor = '\x1b[97m';

  static const int verboseLevel = 0;
  static const int debugLevel = 1;
  static const int infoLevel = 2;
  static const int warningLevel = 3;
  static const int errorLevel = 4;
  static const int maxLength = 128;

  /// 默认INFO等级
  static int defaultMinLevel = 1;

  /// 是否显示日志
  static bool isShowLogs = true;

  /// dart.vm.product 环境标识位 Release为true debug 为false
  static bool isRelease =
      bool.fromEnvironment("dart.vm.product") || !isShowLogs;

  /// VERBOSE
  static void v(String tag, Object message,{bool printAll = false}) {
    if (!isRelease)
      _printLog(tag, '[VERBOSE] -> ', message, verboseLevel,printAll, verboseColor);
  }

  /// DEBUG
  static void d(String tag, Object message,{bool printAll = false}) {
    if (!isRelease)
      _printLog(tag, '[DEBUG] -> ', message, debugLevel,printAll, debugColor);
  }

  /// INFO
  static void i(String tag, Object message,{bool printAll = false}) {
    if (!isRelease) _printLog(tag, '[INFO] -> ', message, infoLevel,printAll, infoColor);
  }

  /// WARNING
  static void w(String tag, Object message,{bool printAll = false}) {
    if (!isRelease)
      _printLog(tag, '[WARNING] -> ', message, warningLevel,printAll, warningColor);
  }

  /// ERROR
  static void e(String tag, Object message, {Exception? e,bool printAll = false}) {
    if (!isRelease)
      _printLog(tag, '[ERROR] -> ', message, errorLevel,printAll, errorColor);
  }

  /// 设置日志等级
  static void setMinLevel(int level) {
    defaultMinLevel = level;
  }

  /// 打印日志
  static void _printLog(String tag, String levelText, Object message, int level,bool printAll,
      [color = defaultColor]) async {
    StringBuffer sb = StringBuffer();
    sb
      ..write(levelText)
      ..write(tag ?? '')
      ..write(': ')
      ..write(message);
    if (level >= defaultMinLevel) {

      if(printAll){
        print('${sb.toString()}');
      }else{
        var str = sb.toString();
        str = str.length > maxLength ? str.substring(0,maxLength) : str;
        print(str);
      }
      
    }

  }

}

class LogModel {
  late int ada; //integer($int64)日志产生时的登陆人ADA号

  late String amwayId; //	string日志产生时的登陆人Aamway ID

  late String content; //	string日志内容，长度:2147483647

  late int createTime; //	integer($int64)日志生成时间

  late String deviceId; //	string设备ID

  late String loggingTime; //	integer($int64) 日志发生时间

  late int type; //	integer($int32) 日志分类，具体分类由前端自己定义

}
