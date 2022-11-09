import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: height * 0.03),
          Text(text),
        ],
      ),
    );
  }
}
