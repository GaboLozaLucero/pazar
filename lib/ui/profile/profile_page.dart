import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/controllers/profile_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';
import 'package:project/ui/widgets/textfield/textfield_email.dart';
import 'package:project/ui/widgets/textfield/textfield_name.dart';
import 'package:project/ui/widgets/textfield/textfield_password.dart';

class ProfilePage extends GetView<AuthController> {
  ProfilePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = controller.appUser;
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Perfil'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SizeForm.margin),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: Get.height * 0.77,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldName(
                      controller: _nameController,
                      title: 'Nombre',
                      hint: '${user.name}',
                    ),
                    TextFieldName(
                      controller: _lastnameController,
                      title: 'Apellido',
                      hint: '${user.lastname}',
                    ),
                    TextFieldEmail(
                      controller: _emailController,
                      title: 'Correo electrónico',
                      hint: '${user.email}',
                    ),
                    TextFieldPassword(
                      controller: _passwordController,
                      title: 'Contraseña',
                    ),
                    TextFieldPassword(
                      controller: _verifyPasswordController,
                      title: 'Verifica tu contraseña',
                    ),            CustomElevatedButton(
                      color: ConstantColors.alertColor,
                      onPress: () {
                        // if (_formKey.currentState?.validate() == false) {
                        //   return;
                        // } else {
                        //   _formKey.currentState?.save();
                        logOut();
                        // }
                      },
                      text: 'actualizar',
                    )

                  ],
                ),
              ),
            ),
            CustomElevatedButton(
              color: ConstantColors.errorColor,
              onPress: () {
                // if (_formKey.currentState?.validate() == false) {
                //   return;
                // } else {
                //   _formKey.currentState?.save();
                logOut();
                // }
              },
              text: 'salir',
            )
          ],
        ),
      ),
    ));
  }

  logOut() {
    Get.dialog(AlertDialog(
      title: Text('¿Estas seguro que quieres salir?', textAlign: TextAlign.center,),
      actions: [
        CustomElevatedButton(
          color: ConstantColors.errorColor,
          onPress: () {
            controller.signOut();
          },
          text: 'Salir',
        ),
        CustomElevatedButton(
          color: ConstantColors.successColor,
          onPress: () {
            Get.back();
          },
          text: 'Volver',
        ),
      ],
    ));
  }
}
