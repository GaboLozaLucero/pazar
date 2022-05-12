import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';

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
    double width = Get.width;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
