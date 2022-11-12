import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/controllers/profile_controller.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';
import 'package:project/ui/widgets/textfield/textfield_email.dart';
import 'package:project/ui/widgets/textfield/textfield_name.dart';
import 'package:project/ui/widgets/textfield/textfield_password.dart';
import 'dart:developer';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Perfil'),
      body: Padding(
        padding: const EdgeInsets.all(SizeForm.margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: SizeForm.margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.2,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed(Routes.profileInformation);
                      },
                      child: Text(
                        'Cambiar\ninformación'.toUpperCase(),
                        style: textInButtonStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                        ),
                        backgroundColor: ConstantColors.successColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.2,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed(Routes.profilePassword);
                      },
                      child: Text(
                        'Cambiar\ncontraseña'.toUpperCase(),
                        style: textInButtonStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                        ),
                        backgroundColor: ConstantColors.successColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: SizeForm.margin),
              child: SizedBox(
                height: Get.height * 0.1,
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                    ),
                    backgroundColor: ConstantColors.mapColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    'lugares visitados'.toUpperCase(),
                    style: textInButtonStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:             Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
            child: CustomElevatedButton(
              color: ConstantColors.errorColor,
              onPress: () {
                logOut();
              },
              text: 'salir',
            ),
          )
          ,
    ),);
  }

  logOut() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          '¿Estas seguro que quieres salir?',
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            height: Get.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Get.width * 0.3,
                  height: Get.height * 0.07,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.find<AuthController>().signOut();
                    },
                    child: Text(
                      'salir'.toUpperCase(),
                      style: textInButtonStyle,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                      ),
                      backgroundColor: ConstantColors.errorColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.3,
                  height: Get.height * 0.07,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'volver'.toUpperCase(),
                      style: textInButtonStyle,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                      ),
                      backgroundColor: ConstantColors.successColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
        ),
      ),
    );
  }
}
