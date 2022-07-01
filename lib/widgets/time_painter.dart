import 'dart:math';
import 'package:adesso_timer/utils/style_constants.dart';
import 'package:flutter/material.dart';

class TimePainter extends StatelessWidget {
  final Animation<double> animation;
  final Color progressColor;

  const TimePainter({required this.animation, required this.progressColor, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomTimePainter(animation: animation, color: progressColor, backgroundColor: snow),
    );
  }
}

class CustomTimePainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  CustomTimePainter({
    required this.backgroundColor,
    required this.animation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), 87, paint);
    paint.color = color;
    final progress = (1 - animation.value) * 2 * pi;
    canvas.drawArc(Rect.fromCenter(center: const Offset(100, 100), width: 175, height: 175), pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimePainter old) {
    return animation.value != old.animation.value || color != old.color || backgroundColor != old.backgroundColor;
  }
}
