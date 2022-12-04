class Api {
  /// OSS prefix
String ossPath = 'http://zw-oss.oss-cn-shenzhen.aliyuncs.com/';

/// service url prefix
String serviceUrl = 'https://zwln.com/api/';
//   static const String BASE_URL = 'http://flutter-go.alibaba.net/';
  // ignore: constant_identifier_names
  static const String BASE_URL = 'http://183.215.45.226:28081/';

  // ignore: constant_identifier_names, prefer_interpolation_to_compose_strings
  static const String DO_LOGIN = BASE_URL + 'ZWUserLongin/UserLogin'; //登陆

  static const String User_Register = BASE_URL + 'ZWUserRegister/UserRegister'; //用户注册

  // ignore: constant_identifier_names, prefer_interpolation_to_compose_strings
  static const String CHECK_LOGIN = BASE_URL + 'checkLogin'; //验证登陆

  static const String LOGOUT = BASE_URL + 'logout'; //退出登陆

  static const String GET_USER_INFO = BASE_URL + 'getUserInfo'; //获取用户信息

  static const String VERSION = BASE_URL + 'getAppVersion'; //检查版本

  static const String FEEDBACK = BASE_URL + 'auth/feedback'; //建议反馈

//  static  const String LOTOUT = BASE_URL+'logout';//退出登陆

  static const String GET_ALL_COLLECTION =
      BASE_URL + 'auth/getAllUserCollection'; //获取全部收藏

  static const String REMOVE_COLLECTION =
      BASE_URL + 'auth/removeCollection'; //移除收藏

  static const String ADD_COLLECTION = BASE_URL + 'auth/addCollection'; //添加收藏

  static const String CHECK_COLLECTED = BASE_URL + 'checkCollected'; //校验收藏

  static const String SET_THEMECOLOR = BASE_URL + 'auth/setThemeColor'; //设置主题颜色

  static const String GET_THEMECOLOR = BASE_URL + '/getThemeColor'; //获取主题颜色

  static const String GET_WIDGET_TREE = BASE_URL + 'getCateList'; //获取widget列表树

  // ignore: prefer_interpolation_to_compose_strings, constant_identifier_names
  static const String SEARCH_WIDGET = BASE_URL + 'searchWidget'; //搜索组件
}
