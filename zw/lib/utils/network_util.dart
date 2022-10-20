import 'dart:async';
import 'package:connectivity/connectivity.dart';

late StreamSubscription<ConnectivityResult> subscription;

class NetworkUtilsTools {
  static late String networkResult;
  /// 获取当前网络信息
  static getNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return '当前处于移动网络';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return '当前处于wifi';
    } else {
      return '网络无连接';
    }
  }

  static isNetWork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi){
      return true;
    }else {
      return false;
    }
  }

  /// 监测当前网络变化
  static watchNetwork() async {
    try {
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        /// Got a new connectivity status!
        if (result == ConnectivityResult.mobile) {
          /// I am connected to a mobile network.
          networkResult = '当前处于移动网络';
          // return '当前处于移动网络';
        } else if (result == ConnectivityResult.wifi) {
          /// I am connected to a wifi network.
          networkResult = '当前处于wifi';
          // return '当前处于wifi';
        } else {
          networkResult = '网络无连接';
          // return '网络无连接';
        }
      });
      return networkResult;
    } catch (err) {
    }
  }
}
