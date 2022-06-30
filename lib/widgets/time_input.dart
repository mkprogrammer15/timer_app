import 'package:adesso_timer/style_constants.dart';
import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({
    required this.timeInput,
    required this.counter,
    Key? key,
  }) : super(key: key);

  final TextEditingController timeInput;
  final ValueNotifier<int> counter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: kTextFieldDeco,
      controller: timeInput,
      onChanged: (value) {
        if (value.isEmpty) {
          counter.value = 0;
        } else {
          timeInput.text = value;
          counter.value = int.parse(value);
        }
      },
    );
  }
}
