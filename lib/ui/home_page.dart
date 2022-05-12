import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/sign_in_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = Get.width;
    double _screenHeight = Get.height;
    return SignInPage();
  }
}
