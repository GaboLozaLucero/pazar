import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/dialog/error_dialog.dart';
import 'package:project/ui/widgets/dialog/success_dialog.dart';
import 'package:project/ui/widgets/textfield/textfield_email.dart';
import 'package:project/ui/widgets/textfield/textfield_password.dart';

class ProfilePassword extends GetView<AuthController> {
  ProfilePassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(title: ''),
      body: Padding(
        padding: EdgeInsets.all(SizeForm.margin),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldPassword(
                  controller: _passwordController,
                  title: 'Nueva contraseña',
                  hint: 'Contraseña',
                ),
                TextFieldPassword(
                  controller: _verifyPasswordController,
                  title: 'Confirmar contraseña',
                  hint: 'Contraseña',
                ),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeForm.margin),
        child: CustomElevatedButton(
            color: ConstantColors.alertColor,
            onPress: () async {
              if (_formKey.currentState?.validate() == false) {
                return;
              } else {
                if (_passwordController.text != _verifyPasswordController.text) {
                  Get.dialog(ErrorDialog(
                      title: 'Error',
                      description: 'Las contraseñas son distintas',
                      function: () {
                        Get.back();
                      }));
                  return;
                }
                _formKey.currentState?.save();
                reAuthentication();
              }
            },
            text: 'Actualizar'),
      ),
    ));
  }

  reAuthentication() {
    final GlobalKey<FormState> _formKeyAuthentication = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordControllerAuthentication = TextEditingController();
    Get.dialog(
      AlertDialog(
          title: Text(
            'Ingresa tus\ncredenciales',
            style: textTitleStories,
            textAlign: TextAlign.center,
          ),
          content: Form(
            key: _formKeyAuthentication,
            child: SizedBox(
              height: Get.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextFieldEmail(
                        //Custom text field for emails
                        controller: _emailController,
                        title: 'Correo electrónico',
                      ),
                      TextFieldPassword(
                        //Custom text field for passwords
                        controller: _passwordControllerAuthentication,
                        title: 'Contraseña',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Get.width * 0.35,
                  height: Get.height * 0.07,
                  child: OutlinedButton(
                    onPressed: () async {
                      if (!await controller.signInUser(_emailController.text, _passwordControllerAuthentication.text)) {
                        Get.dialog(ErrorDialog(
                            title: 'Error',
                            description: 'La autenticación no es correcta',
                            function: () {
                              Get.back();
                            }));
                      } else {
                        await controller.changePassword(_passwordController.text);
                        Get.dialog(SuccessDialog(
                            title: 'Éxito',
                            description: 'La contraseña se ha modificado',
                            function: () {
                              Get.back();
                            }));
                      }
                    },
                    child: Text(
                      'ingresar'.toUpperCase(),
                      style: textInButtonStyle,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                      ),
                      backgroundColor: ConstantColors.alertColor,
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
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
          )),
    );
  }
}
