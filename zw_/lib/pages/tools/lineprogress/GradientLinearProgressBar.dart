import 'package:flutter/material.dart';

class GradientLinearProgressBar extends StatelessWidget {

  final double strokeWidth;//画笔的宽度，其实是进度条的高度
  final bool strokeCapRound;//是否需要圆角
  final double value;//进度值
  final Color backgroundColor;//进度条背景色
  final List<Color> colors;//渐变的颜色列表
  final List<double> stops;

  GradientLinearProgressBar({
    this.strokeWidth = 2.0,
    required this.colors,
    required this.stops,
    required this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.strokeCapRound = false
  });

  @override
  Widget build(BuildContext context) {
    var _colors = colors;
    var _stops  =  stops;
    if (_colors == null) {
      Color color = Theme.of(context).colorScheme.secondary;
      _colors = [color, color];
    }

    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _GradientLinearProgressPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          colors: _colors,
          stops:_stops
      ),
    );
  }
}

class _GradientLinearProgressPainter extends CustomPainter{

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final List<double> stops;
  final p = Paint();

  _GradientLinearProgressPainter({
    this.strokeWidth = 2.0,
    required this.colors,
    this.value = 0.0,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.strokeCapRound = false,
    required this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    p.strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt;
    p.style = PaintingStyle.fill;
    p.isAntiAlias = true;
    p.strokeWidth = strokeWidth;

    double _offset = strokeWidth / 2;//留一定的偏移量
    var start = Offset(_offset, _offset);//画笔起点坐标
    var end = Offset(size.width, _offset);//画笔终点坐标

    if (backgroundColor != Colors.transparent) {
      p.color = backgroundColor;
      canvas.drawLine(start, end, p);
    }

    if (value > 0) {
      var valueEnd = Offset(value * size.width + _offset, _offset);//计算进度的长度
      Rect rect = Rect.fromPoints(start, valueEnd);
      p.shader = LinearGradient(colors: colors, stops: stops).createShader(rect);
      p.color = Colors.amber;
      canvas.drawLine(start, valueEnd, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}