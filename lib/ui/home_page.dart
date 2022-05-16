import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = Get.width;
    double _height = Get.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(SizeForm.margin),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.15,
                child: Image.asset('./assets/images/logo.png'),
              ),
              Row(
              ),
            ],
          ),
        ),
      ),
    );
  }
}
