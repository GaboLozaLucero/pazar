import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/custom_textbutton.dart';
import 'package:project/ui/widgets/textfield/textfield_email.dart';
import 'package:project/ui/widgets/textfield/textfield_name.dart';
import 'package:project/ui/widgets/textfield/textfield_password.dart';
import 'package:project/navigation/pages.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

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
            children: [
              SizedBox(
                height: _height * 0.15,
                width: _width,
                child: Image.asset('./assets/images/logo.png'),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              SizedBox(
                height: _height * 0.6,
                width: _width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TextFieldName(
                              controller: _nameController,
                              title: 'Nombre',
                            ),
                            TextFieldName(
                              controller: _lastnameController,
                              title: 'Apellido',
                            ),
                            TextFieldEmail(
                              controller: _emailController,
                              title: 'Correo electrónico',
                            ),
                            TextFieldPassword(
                              controller: _passwordController,
                              title: 'Contraseña',
                            ),
                            TextFieldPassword(
                              controller: _verifyPasswordController,
                              title: 'Verifica tu contraseña',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomElevatedButton(
                color: ConstantColors.buttonSignUpColor,
                onPress: () => Get.toNamed(Routes.homePage),
                text: 'registrase',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿Ya tienes una cuenta?'),
                  CustomTextButton(
                    text: 'Ingresa aquí',
                    onPress: () => Get.toNamed(Routes.signIn),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
