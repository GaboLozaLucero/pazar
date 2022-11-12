import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/custom_textbutton.dart';
import 'package:project/ui/widgets/dialog/error_dialog.dart';
import 'package:project/ui/widgets/textfield/textfield_email.dart';
import 'package:project/ui/widgets/textfield/textfield_password.dart';
import 'package:project/navigation/pages.dart';

class SignInPage extends GetView<AuthController> {
  SignInPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = Get.height;
    double _width = Get.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: _width,
                child: Image.asset('./assets/images/logos.png', fit: BoxFit.fill,),
              ),
              SizedBox(
                height: _height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(SizeForm.margin),
                child: SizedBox(
                  height: _height * 0.55,
                  width: _width,
                  child: Form(
                    key: _formKey,
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
                              controller: _passwordController,
                              title: 'Contraseña',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                color: ConstantColors.buttonSignInColor,
                onPress: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  } else {
                    _formKey.currentState?.save();
                    signInUser();
                  }
                },
                text: 'ingresar',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                    style: textNormal,
                  ),
                  CustomTextButton(
                    text: 'Regístrate aquí',
                    onPress: () => Get.toNamed(Routes.signUp),
                    textStyle: const TextStyle(
                      fontSize: 12.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  signInUser() async {
    if(!await controller.signInUser(_emailController.text, _passwordController.text))
      {
        Get.dialog(ErrorDialog(title: 'Error', description: 'La autenticación no es correcta', function: (){Get.back();}));
      }
  }
}
