import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';

class Snackbar {
  static successSnackbar(String title, String message){
    Get.snackbar(title, message,backgroundColor: ConstantColors.successColor);
  }
  static errorSnackbar(String title, String message){
    Get.snackbar(title, message,backgroundColor: ConstantColors.errorColor);
  }
}