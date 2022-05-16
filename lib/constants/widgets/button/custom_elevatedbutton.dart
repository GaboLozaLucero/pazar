import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.color,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  final Color color;
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    double _width = Get.width;
    double _height = Get.height;
    return SizedBox(
      width: _width,
      height: _height * 0.07,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
            ),
          ),
        ),
        onPressed: () {
          onPress();
        },
        child: Text(
          text.toUpperCase(),
          style: textInButtonStyle,
        ),
      ),
    );
  }
}
