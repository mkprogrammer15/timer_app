import 'dart:async';
import 'package:flutter/foundation.dart';

mixin TimerService {
  static final counter = ValueNotifier<int>(10);
  static late Timer _timer;

  static void startTimer(int timeInput) {
    counter.value = timeInput;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        _timer.cancel();
      }
    });
  }

  static void stopTimer() {
    _timer.cancel();
  }

  static void resetTimer() {
    counter.value = 0;
  }
}
