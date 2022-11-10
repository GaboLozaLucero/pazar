import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: ConstantColors.buttonColor,
              strokeWidth: SizeForm.radius,
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              height: Get.height*0.1,
              child: AnimatedTextKit(animatedTexts: [
                ScaleAnimatedText(text, textStyle: const TextStyle(fontSize: SizeForm.textFieldTitleSize*2),),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
