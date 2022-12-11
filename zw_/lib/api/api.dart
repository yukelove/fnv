class Api {
  /// OSS prefix
  String ossPath = 'http://zw-oss.oss-cn-shenzhen.aliyuncs.com/';

  /// service url prefix
  String serviceUrl = 'https://zwln.com/api/';

  static const String BASE_URL = 'http://183.215.45.226:28081/';

  static const String DO_LOGIN = BASE_URL + 'ZWUserLongin/UserLogin'; //登陆

  static const String User_Register =
      BASE_URL + 'ZWUserRegister/UserRegister'; //用户注册

  static const String Equipment_ADD = BASE_URL + 'ZWAddDevice/AddDevices'; //添加设备

}
