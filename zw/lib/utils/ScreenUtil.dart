import 'package:flutter/material.dart';

class ScreenUtil {
  static late ScreenUtil _instance;
  static const int defaultWidth = 375;
  static const int defaultHeight = 812;

  /// UI设计中手机尺寸 , px
  /// Size of the phone in UI Design , px
  late num uiWidthPx;
  late num uiHeightPx;

  /// 控制字体是否要根据系统的“字体大小”辅助选项来进行缩放。默认值为false。
  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  late  bool allowFontScaling;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  static void init(BuildContext context,
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false}) {
    if (_instance == null) {
      _instance = ScreenUtil._();
    }
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;

    MediaQueryData mediaQuery = MediaQuery.of(context);
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  /// 每个逻辑像素的字体像素数，字体的缩放比例
  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// 当前设备宽度 dp
  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth;

  ///当前设备高度 dp
  ///The vertical extent of this size. dp
  static double get screenHeight => _screenHeight;

  /// 当前设备宽度 px
  /// The vertical extent of this size. px
  static double get screenWidthPx => _screenWidth * _pixelRatio;

  /// 当前设备高度 px
  /// The vertical extent of this size. px
  static double get screenHeightPx => _screenHeight * _pixelRatio;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// 底部安全区距离 dp
  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// 实际的dp与UI设计px的比例
  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth / uiWidthPx;

  double get scaleHeight => _screenHeight / uiHeightPx;

  double get scaleText => scaleWidth;

  /// 根据UI设计的设备宽度适配
  /// 高度也可以根据这个来做适配可以保证不变形,比如你先要一个正方形的时候.
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// 根据UI设计的设备高度适配
  /// 当发现UI设计中的一屏显示的与当前样式效果不符合时,
  /// 或者形状有差异时,建议使用此方法实现高度适配.
  /// 高度适配主要针对想根据UI设计的一屏展示一样的效果
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  num setHeight(num height) => height * scaleHeight;

  ///字体大小适配方法
  ///@param [fontSize] UI设计上字体的大小,单位px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  // num setSp(num fontSize, {bool? allowFontScalingSelf}) =>
  //     allowFontScalingSelf == null
  //         ? (allowFontScaling
  //             ? (fontSize * scaleText)
  //             : ((fontSize * scaleText) / _textScaleFactor))
  //         : (allowFontScalingSelf
  //             ? (fontSize * scaleText)
  //             : ((fontSize * scaleText) / _textScaleFactor));
  // // 获取适配的textStyle
  // TextStyle getTextStyle(TextStyle textStyle) {
  //   TextStyle newStyle =
  //       textStyle.copyWith(fontSize: setSp(textStyle.fontSize));
  //   return newStyle;
  // }
}

extension SizeExtension on num {
  ///[EcScreenUtil.setWidth]
  num get w => ScreenUtil().setWidth(this);

  ///[EcScreenUtil.setHeight]
  num get h => ScreenUtil().setHeight(this);

  // ///[EcScreenUtil.setSp]
  // num get sp => ScreenUtil().setSp(this, allowFontScalingSelf: true);
  //
  // ///[EcScreenUtil.setSp]
  // num get ssp => ScreenUtil().setSp(this, allowFontScalingSelf: true);
  //
  // ///[EcScreenUtil.setSp]
  // num get nsp => ScreenUtil().setSp(this, allowFontScalingSelf: false);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  num get wp => ScreenUtil.screenWidth * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  num get hp => ScreenUtil.screenHeight * this;
}
