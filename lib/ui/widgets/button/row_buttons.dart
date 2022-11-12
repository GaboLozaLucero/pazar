import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({
    Key? key,
    required this.firstFunction,required this.firstText,
    required this.firstColor,

    required this.secondFunction,required this.secondText,
    required this.secondColor,

  }) : super(key: key);

  final Function firstFunction;
  final String firstText;
  final Color firstColor;
  final Function secondFunction;
  final String secondText;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              firstFunction();
            },
            child: Text(
              firstText.toUpperCase(),
              style: textInButtonStyle,
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
              ),
              backgroundColor: firstColor,
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.02,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              secondText.toUpperCase(),
              style: textInButtonStyle,
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
              ),
              backgroundColor: secondColor,
            ),
          ),
        ),
      ],
    );
  }
}
