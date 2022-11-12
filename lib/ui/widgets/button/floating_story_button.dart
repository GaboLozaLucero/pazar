import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';

class FloatingStoryButton extends StatelessWidget {
  const FloatingStoryButton({Key? key, required this.iconData, required this.function}) : super(key: key);

  final IconData iconData;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin / 2),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          side: const BorderSide(
            width: 2,
            color: ConstantColors.floatingSideButtonColor,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(SizeForm.margin / 1.5),
        ),
        onPressed: () {
          function();
        },
        child: Icon(
          iconData,
          size: 40,
          color: ConstantColors.floatingButtonColor,
        ),
      ),
    );
  }
}
