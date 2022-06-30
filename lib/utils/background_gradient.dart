import 'package:adesso_timer/style_constants.dart';
import 'package:flutter/material.dart';

class BackGroundGradient extends StatelessWidget {
  final Widget child;

  const BackGroundGradient({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [cherry, inkDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.8],
        tileMode: TileMode.clamp,
      )),
      child: child,
    );
  }
}
