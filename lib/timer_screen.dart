import 'dart:math';

import 'package:adesso_timer/timer_service/timer_service.dart';
import 'package:adesso_timer/utils/background_gradient.dart';
import 'package:adesso_timer/utils/style_constants.dart';
import 'package:adesso_timer/widgets/button_timer.dart';
import 'package:adesso_timer/widgets/time_input.dart';
import 'package:adesso_timer/widgets/time_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> progressAnimation;
  bool startButtonIsActive = false;

  final TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    progressAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    progressAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ink,
        title: const Text(
          'Fancy Timer',
          style: TextStyle(color: corp),
        ),
        centerTitle: true,
      ),
      body: BackGroundGradient(
        child: ValueListenableBuilder(
          valueListenable: TimerService.counter,
          builder: (context, _, __) => SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 140,
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2, color: inkDark), borderRadius: BorderRadius.circular(90)),
                    width: 250,
                    height: 50,
                    child: TimeInput(timeInput: timeInput, counter: TimerService.counter),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: TimePainter(
                          animation: progressAnimation,
                          progressColor: progressAnimation.value > 0.6 ? Colors.red : apple,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: const BoxDecoration(color: inkBrightest, shape: BoxShape.circle),
                        ),
                      ),
                      Text(
                        'Seconds : ${TimerService.counter.value}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimerButton(
                          timeInput: timeInput,
                          onPressed: startButtonIsActive
                              ? () {}
                              : () {
                                  startButtonIsActive = true;
                                  final userValue = int.parse(timeInput.text.isEmpty ? '10' : timeInput.text);
                                  if (TimerService.counter.value != userValue) {
                                    return;
                                  } else {
                                    TimerService.startTimer(userValue);
                                    setState(() {
                                      controller
                                        ..duration = Duration(seconds: TimerService.counter.value)
                                        ..forward();
                                    });
                                  }
                                },
                          backGroundColor: startButtonIsActive ? blueyGrey : apple,
                          buttonName: 'Start',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TimerButton(
                          buttonName: 'Stop',
                          backGroundColor: cherry,
                          timeInput: timeInput,
                          onPressed: () {
                            startButtonIsActive = false;
                            TimerService.stopTimer();
                            TimerService.resetTimer();
                            timeInput.clear();
                            controller.reset();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
