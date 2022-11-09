import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/custom_textbutton.dart';
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
          padding: const EdgeInsets.all(SizeForm.margin),
          physics: const BouncingScrollPhysics(),
          reverse: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _height * 0.25,
                width: _width,
                child: Image.asset('./assets/images/logo.png'),
              ),
              SizedBox(
                height: _height * 0.1,
              ),
              SizedBox(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              const Text(
                                '¿No tienes una cuenta?',
                              ),
                              CustomTextButton(
                                text: 'Regístrate aquí',
                                onPress: () => Get.toNamed(Routes.signUp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signInUser() async {
    controller.signInUser(_emailController.text, _passwordController.text);
  }
}
