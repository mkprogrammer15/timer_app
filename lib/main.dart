import 'package:adesso_timer/timer_screen.dart';
import 'package:adesso_timer/timer_service/timer_service.dart';
import 'package:adesso_timer/utils/background_gradient.dart';
import 'package:adesso_timer/utils/style_constants.dart';
import 'package:adesso_timer/widgets/button_timer.dart';
import 'package:adesso_timer/widgets/time_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerScreen(),
    );
  }
}
