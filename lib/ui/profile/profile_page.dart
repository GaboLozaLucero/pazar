import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/row_buttons.dart';
import 'package:project/ui/widgets/card/main_menu_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cambiar\ninformación'.toUpperCase(),
                              style: profileButtons,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: Get.height * 0.065,
                              width: Get.width * 0.12,
                              child: Image.asset('./././assets/images/information.png'),
                            )
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                          ),
                          side: const BorderSide(color: ConstantColors.successColor, width: 2.0),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cambiar\ncontraseña'.toUpperCase(),
                              style: profileButtons,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: Get.height * 0.065,
                              width: Get.width * 0.12,
                              child: Image.asset('./././assets/images/reset-password.png'),
                            ),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                          ),
                          side: const BorderSide(color: ConstantColors.successColor, width: 2.0),
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
                      backgroundColor: ConstantColors.appBarBackgroundColor,
                      side: const BorderSide(color: ConstantColors.legendColor, width: 2.0),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.likedPlaces);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'lugares\nfavoritos'.toUpperCase(),
                          style: profileButtons,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                          child: Image.asset('./././assets/images/like.png'),
                        )
                      ],
                    ),
                  ),
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
                      backgroundColor: ConstantColors.appBarBackgroundColor,
                      side: const BorderSide(color: ConstantColors.legendIconColor, width: 2.0),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.popularPlaces);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'lugares\npopulares'.toUpperCase(),
                          style: profileButtons,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                          child: Image.asset('./././assets/images/popular.png'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
          child: CustomElevatedButton(
            color: ConstantColors.errorColor,
            onPress: () {
              logOut();
            },
            text: 'salir',
          ),
        ),
      ),
    );
  }

  logOut() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          '¿Estas seguro que quieres salir?',
          textAlign: TextAlign.center,
        ),
        actions: [
          RowButtons(
              firstFunction: () async {
                Get.find<AuthController>().signOut();
              },
              firstText: 'salir',
              firstColor: ConstantColors.errorColor,
              secondFunction: () {
                Get.back();
              },
              secondText: 'volver',
              secondColor: ConstantColors.successColor)
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
        ),
      ),
    );
  }
}
