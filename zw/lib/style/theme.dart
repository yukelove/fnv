import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Theme {

  ///登录界面，定义渐变的颜色
  static const Color loginGradientStart = Color(0xFFffffff);
  static const Color loginGradientEnd = Color(0xFFf78800);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [loginGradientStart, loginGradientEnd],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}