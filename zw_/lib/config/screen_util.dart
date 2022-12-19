import 'dart:ui';

class ScreenUtil {
  static ScreenUtil _instance = ScreenUtil._initialize();
  static const Size defaultSize = Size(414, 896);

  Size uiSize = defaultSize;
  bool allowFontScaling = false;
  static late double _pixelRatio;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  factory ScreenUtil() {
    return _instance;
  }

  //初始化方法
  ScreenUtil._initialize();

  //对外初始化方法
  ScreenUtil.init({
    Size designSize = defaultSize,
    bool allowFontScaling = false,
  }) {
    _instance.uiSize = designSize;
    _instance.allowFontScaling = allowFontScaling;
    ScreenUtil._pixelRatio = window.devicePixelRatio;
    ScreenUtil._screenWidth = window.physicalSize.width / _pixelRatio;
    ScreenUtil._screenHeight = window.physicalSize.height / _pixelRatio;
    ScreenUtil._statusBarHeight = window.padding.top / _pixelRatio;
    ScreenUtil._bottomBarHeight = window.padding.bottom / _pixelRatio;
    ScreenUtil._textScaleFactor = window.textScaleFactor;
  }

    /// 每个逻辑像素的字体像素数，字体的缩放比例
  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => _textScaleFactor;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  double get pixelRatio => _pixelRatio;

  /// 当前设备宽度 dp
  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth;

  ///当前设备高度 dp
  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight;

  /// 当前设备宽度 px
  /// The vertical extent of this size. px
  double get screenWidthPx => _screenWidth * _pixelRatio;

  /// 当前设备高度 px
  /// The vertical extent of this size. px
  double get screenHeightPx => _screenHeight * _pixelRatio;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top
  double get statusBarHeight => _statusBarHeight;

  /// 底部安全区距离 dp
  /// The offset from the bottom.
  double get bottomBarHeight => _bottomBarHeight;

  /// 实际的dp与UI设计px的比例
  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth / uiSize.width;

  double get scaleHeight => _screenHeight / uiSize.height;

  double get scaleText => scaleWidth;

  /// 根据UI设计的设备宽度适配
  /// 高度也可以根据这个来做适配可以保证不变形,比如你先要一个正方形的时候.
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  double setDoubleWidth(double width) => width * scaleWidth;

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
  num setSp(num fontSize, {bool? allowFontScalingSelf}) => allowFontScalingSelf == null
      ? (allowFontScaling ? (fontSize * scaleText) : ((fontSize * scaleText) / _textScaleFactor))
      : (allowFontScalingSelf ? (fontSize * scaleText) : ((fontSize * scaleText) / _textScaleFactor));
}

extension SizeDoubleExtension on double{

  double get w => ScreenUtil().setDoubleWidth(this);

}


extension SizeExtension on num {
  
  num get w => ScreenUtil().setWidth(this);

  
  num get h => ScreenUtil().setHeight(this);

  
  num get sp => ScreenUtil().setSp(this, allowFontScalingSelf: true);

  
  num get ssp => ScreenUtil().setSp(this, allowFontScalingSelf: true);

  
  num get nsp => ScreenUtil().setSp(this, allowFontScalingSelf: false);


  num get wp => ScreenUtil().screenWidth * this;

  ///屏幕高度的倍数
  num get hp => ScreenUtil().screenHeight * this;

}

