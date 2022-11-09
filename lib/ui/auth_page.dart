import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/ui/home_page.dart';
import 'package:project/ui/sign_in_page.dart';

class AuthPage extends GetWidget<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.verifyUser();
    return Obx(() {
      final authStatus = controller.authStatus;
      if (authStatus == AuthStatus.loadingResources) {
        controller.verifyUser();
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
        return const HomePage();
      }
    });
  }
}
