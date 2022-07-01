import 'package:adesso_timer/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return TextFormField(
      cursorColor: inkDark,
      inputFormatters: [
        LengthLimitingTextInputFormatter(2),
        LimitRange(0, 99),
      ],
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      decoration: kTextFieldDeco,
      controller: timeInput..selection = TextSelection.fromPosition(TextPosition(offset: timeInput.text.length)),
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

class LimitRange extends TextInputFormatter {
  LimitRange(
    this.minRange,
    this.maxRange,
  ) : assert(
          minRange < maxRange,
        );

  final int minRange;
  final int maxRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = int.parse(newValue.text.isEmpty ? '0' : newValue.text);
    if (value < minRange) {
      return TextEditingValue(text: minRange.toString());
    } else if (value > maxRange) {
      return TextEditingValue(text: maxRange.toString());
    }
    return newValue;
  }
}
