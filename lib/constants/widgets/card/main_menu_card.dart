import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';

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
    return Container(
      height: _height * 0.3,
      width: _width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeForm.radius),
        border: Border.all(width: SizeForm.mainCardBorder,
          color: color,
        ),
      ),
      child: ElevatedButton(style: ButtonStyle(
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
            title.toUpperCase(), style: TextStyle(color: Colors.black),
      ),
      SizedBox(
        child: Image.asset(image),
      ),
      Text(description, style: TextStyle(color: Colors.black, )),
        ],
      ),
    ),);
  }
}
