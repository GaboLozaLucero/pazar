import 'package:flutter/material.dart';
import 'package:project/constants/contant_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: ConstantColors.textButtonColor,
        ),
      ),
    );
  }
}
