import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final Function onPress;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        text.toUpperCase(),
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
