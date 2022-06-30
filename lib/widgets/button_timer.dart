import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    required this.timeInput,
    required this.onPressed,
    required this.backGroundColor,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  final TextEditingController timeInput;
  final VoidCallback onPressed;
  final Color backGroundColor;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((size) => const Size(100, 50)),
        backgroundColor: MaterialStateProperty.resolveWith((color) => backGroundColor),
      ),
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
