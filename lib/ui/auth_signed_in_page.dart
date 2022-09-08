import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/enum/auth_status.dart';

class AuthSignedInPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final AuthController authController = Get.find<AuthController>();
      final authStatus = authController.authStatus;
      if (authStatus == AuthStatus.loadingResources) {
        Get.find<AuthController>().verifyUser();
        log('LOADING AUTHENTICATION');
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Container();
    });
  }
}
