import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/contant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/widgets/button/custom_elevatedbutton.dart';
import 'package:project/constants/widgets/button/custom_textbutton.dart';
import 'package:project/constants/widgets/textfield/textfield_email.dart';
import 'package:project/constants/widgets/textfield/textfield_password.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SizeForm.margin),
          physics: const BouncingScrollPhysics(),
          reverse: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.4,
                width: width,
                child: Image.asset('./assets/images/logo.png'),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.45,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TextFieldEmail(
                            controller: _emailController,
                            title: 'Correo electrónico',
                            icon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFieldPassword(
                            controller: _passwordController,
                            title: 'Contraseña',
                            icon: Icons.key_outlined,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomElevatedButton(
                            color: ConstantColors.buttonSignInColor,
                            onPress: () {},
                            text: 'Ingresar',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('¿No tienes una cuenta?'),
                              CustomTextButton(text: 'Regístrate aquí'),
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
}
