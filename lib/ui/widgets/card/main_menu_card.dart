import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';

class MainMenuCard extends StatelessWidget {
  const MainMenuCard({
    Key? key,
    required this.color,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  final Color color;
  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    double _height = Get.height;
    double _width = Get.width;
    double _containerHeight = _height * 0.33;
    double _containerWidth = _width * 0.4;
    return Container(
      height: _containerHeight,
      width: _containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeForm.radius),
        border: Border.all(
          width: SizeForm.mainCardBorder,
          color: color,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeForm.radius),
            ),
          ),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: textInMainCard,
            ),
            SizedBox(
              child: Image.asset(image),
            ),
            Container(
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(SizeForm.radius),),
              child: Padding(
                padding: const EdgeInsets.all(SizeForm.margin/2.5),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: textInDescriptionCard,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
