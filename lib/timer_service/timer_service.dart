import 'dart:async';
import 'package:flutter/foundation.dart';

mixin TimerService {
  static final counter = ValueNotifier<int>(0);
  static late Timer timer;
  static final isTicking = ValueNotifier<bool>(false);

  static void startTimer(int timeInput) {
    counter.value = timeInput;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
        isTicking.value = true;
      } else {
        timer.cancel();
        isTicking.value = false;
      }
    });
  }

  static void stopTimer() {
    timer.cancel();
    isTicking.value = false;
  }

  static void resetTimer() {
    counter.value = 0;
    isTicking.value = false;
  }
}
