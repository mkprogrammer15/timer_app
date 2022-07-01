import 'dart:math';
import 'package:adesso_timer/timer_service/timer_service.dart';
import 'package:adesso_timer/utils/style_constants.dart';
import 'package:flutter/material.dart';

class TimePainter extends StatefulWidget {
  @override
  _TimePainterState createState() => _TimePainterState();
}

class _TimePainterState extends State<TimePainter> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final anim = ValueNotifier<double>(0);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 100))..addListener(() {});
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        anim.value = TimerService.counter.value + 0.0;
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: anim,
        builder: (
          context,
          _,
        ) {
          if (TimerService.isTicking.value) {
            anim.value = TimerService.counter.value + 0.0;
            controller.forward();
          } else {
            controller.stop();
          }
          return CustomPaint(
            painter: CustomTimePainter(animation: animation, color: apple, backgroundColor: snow),
          );
        });
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

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    final progress = (1 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimePainter old) {
    return animation.value != old.animation.value || color != old.color || backgroundColor != old.backgroundColor;
  }
}
