import 'dart:math';

import 'package:flutter/material.dart';

class AnnulusDashboardProgressBar extends StatelessWidget {
  final double height;
  final double width;

  /// 中间文本
  final String centerText;

  /// 中间文本单位
  final String centerTextUnit;

  /// 底下文本
  final String bottomText;

  /// 中间文字颜色，包括单位
  final Color centerTextColor;

  /// 中间文字大小
  final double centerTextSize;

  /// 中间文字单位大小
  final double centerTextUnitSize;

  /// 底下文本颜色
  final Color bottomTextColor;

  /// 底下文本大小
  final double bottomTextSize;

  ///控件可转动的最大角度
  final double maxAngle;

  ///刻度线选中颜色(默认蓝色)
  final Color highlightColor;

  ///刻度线选中颜色(默认绿色色)
  final Color middleColor;

  ///刻度线选中颜色(默认红色)
  final Color highColor;

  ///刻度线未选中颜色（默认灰色）
  final Color normalColor;

  /// 刻度线高度
  final double scaleHeight;

  ///刻度线宽度
  final double scaleWidth;

  ///刻度分布类型(刻度数量)
  final int scaleType;

  ///已选择的刻度值
  final double sweepScale;

  /// 最大刻度
  final double maxScale;

  const AnnulusDashboardProgressBar(
      {super.key,
        this.height = 150,
        this.width = 150,
        this.centerText = "",
        this.centerTextUnit = "",
        this.bottomText = "",
        this.centerTextColor = const Color.fromARGB(255, 51, 51, 51),
        this.centerTextSize = 39,
        this.centerTextUnitSize = 21,
        this.bottomTextColor = const Color.fromARGB(255, 51, 51, 51),
        this.bottomTextSize = 18,
        this.maxAngle = 240,
        this.highlightColor = const Color.fromARGB(255, 90, 200, 250),
        this.middleColor = const Color.fromARGB(255, 0, 255, 0),
        this.highColor = const Color.fromARGB(255, 255, 0, 0),
        this.normalColor = const Color.fromARGB(255, 206, 206, 206),
        this.scaleHeight = 10,
        this.scaleWidth = 2,
        this.scaleType = 27,
        this.sweepScale = 0,
        this.maxScale = 100});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child:
          Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
            CustomPaint(
              size: Size(width, height),
              painter: _AnnulusDashboardProgressBarPainter(this),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  centerText,
                  style:
                  TextStyle(color: centerTextColor, fontSize: centerTextSize),
                ),
                Text(
                  centerTextUnit,
                  style: TextStyle(
                      color: centerTextColor, fontSize: centerTextUnitSize),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                child: Text(
                  bottomText,
                  style:
                  TextStyle(color: bottomTextColor, fontSize: bottomTextSize),
                )),
          ]),
        ));
  }
}

class _AnnulusDashboardProgressBarPainter extends CustomPainter {
  final AnnulusDashboardProgressBar holder;

  double _arcRadius = 0;
  double _centerX = 0;
  double _centerY = 0;

  _AnnulusDashboardProgressBarPainter(this.holder) {
    _arcRadius = min(holder.width, holder.height) / 2 - holder.scaleHeight;
    _centerX = holder.width / 2;
    _centerY = holder.height / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double oneAngle = holder.maxAngle / holder.scaleType;
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = holder.scaleWidth
      ..color = holder.normalColor
      ..isAntiAlias = true;

    ///画背景指针
    Path pathBackground = Path();
    for (int i = 0; i < holder.scaleType; i++) {
      double curRadians = (oneAngle * i - 115) * pi / 180;
      double sinAngle = sin(curRadians);
      double cosAngle = cos(curRadians);
      pathBackground.moveTo(
          sinAngle * _arcRadius + _centerX,
          (2 * _arcRadius + 2 * holder.scaleHeight) -
              (cosAngle * _arcRadius + _centerY));
      pathBackground.lineTo(
          sinAngle * (_arcRadius + holder.scaleHeight) + _centerX,
          (2 * _arcRadius + 2 * holder.scaleHeight) -
              (cosAngle * (_arcRadius + holder.scaleHeight) + _centerY));
    }
    canvas.drawPath(pathBackground, paint);

    /// 画前景指针
    Path pathForeground = Path();
    int curScale = holder.scaleType * holder.sweepScale ~/ holder.maxScale;
    for (int i = 0; i < curScale; i++) {
      double curRadians = (oneAngle * i - 115) * pi / 180;
      double sinAngle = sin(curRadians);
      double cosAngle = cos(curRadians);
      pathForeground.moveTo(
          sinAngle * _arcRadius + _centerX,
          (2 * _arcRadius + 2 * holder.scaleHeight) -
              (cosAngle * _arcRadius + _centerY));
      pathForeground.lineTo(
          sinAngle * (_arcRadius + holder.scaleHeight) + _centerX,
          (2 * _arcRadius + 2 * holder.scaleHeight) -
              (cosAngle * (_arcRadius + holder.scaleHeight) + _centerY));
    }
    
    
    paint.color = holder.highlightColor;
    
    canvas.drawPath(pathForeground, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}