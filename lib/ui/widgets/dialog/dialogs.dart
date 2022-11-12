import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static successDialog(String title, String middleText) {
    Get.defaultDialog(title: title, middleText: middleText, barrierDismissible: false, actions: [
      ElevatedButton(
        onPressed: () {},
        child: const Text('OK'),
      ),
    ]);
  }

  static errorDialog(String title, String middleText, Function function) {
    Get.defaultDialog(title: title, middleText: middleText, barrierDismissible: false, actions: [
      ElevatedButton(
          onPressed: () {
            function;
          },
          child: const Text('Ok'))
    ]);
  }
}
