import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/ui/home_page.dart';
import 'package:project/ui/sign_in_page.dart';

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
      } else if (authStatus == AuthStatus.unauthenticated) {
        return SignInPage();
      } else {
        return HomePage();
      }
    });
  }
}
