import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/row_buttons.dart';
import 'package:project/ui/widgets/dialog/alert_dialog.dart';
import 'package:project/ui/widgets/dialog/error_dialog.dart';
import 'package:project/ui/widgets/dialog/success_dialog.dart';
import 'package:project/ui/widgets/textfield/textfield_name.dart';

class ProfileInformationPage extends GetView<AuthController> {
  ProfileInformationPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  // final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: ''),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(SizeForm.margin),
          child: Obx(
            () {
              return (controller.authStatus == AuthStatus.loadingResources)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ConstantColors.buttonColor,
                        strokeWidth: SizeForm.radius,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFieldName(
                          controller: _nameController,
                          title: 'Nombre',
                          hint: '${controller.appUser.name}',
                        ),
                        TextFieldName(
                          controller: _lastnameController,
                          title: 'Apellido',
                          hint: '${controller.appUser.lastname}',
                        ),
                      ],
                    );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
          child: CustomElevatedButton(
            color: ConstantColors.alertColor,
            onPress: () {
              if (_nameController.text == controller.appUser.name || _lastnameController.text == controller.appUser.lastname) {
                noChanges();
              } else if (_nameController.text.isEmpty && _lastnameController.text.isEmpty) {
                noChanges();
              } else {
                AppUser appUser = AppUser(
                    name: controller.appUser.name,
                    lastname: controller.appUser.lastname,
                    email: controller.appUser.email,
                    uid: controller.appUser.uid);
                if (_nameController.text.isNotEmpty) {
                  appUser.name = _nameController.text;
                }
                if (_lastnameController.text.isNotEmpty) {
                  appUser.lastname = _lastnameController.text;
                }
                saveInformation(appUser);
              }
            },
            text: 'actualizar',
          ),
        ),
      ),
    );
  }

  noChanges() {
    Get.dialog(
      AlertingDialog(
        title: 'Error',
        description: 'No existen cambios en la información',
        function: () {
          Get.back();
        },
      ),
    );
  }

  saveInformation(AppUser appUser) {
    Get.dialog(
      AlertDialog(
        title: Text(
          '¿Cambiar información?',
          style: textInformationDialog,
        ),
        actions: [
          RowButtons(
            firstFunction: () async {
              bool result = await controller.updateUser(appUser);
              if (result) {
                Get.back();
                _changedInformation();
                _nameController.clear();
                _lastnameController.clear();
              } else {
                Get.back();
                _errorInformation();
              }
            },
            firstColor: ConstantColors.alertColor,
            firstText: 'sí',
            secondFunction: () {
              Get.back();
            },
            secondColor: ConstantColors.errorColor,
            secondText: 'no',
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
        ),
      ),
    );
  }

  _changedInformation() {
    Get.dialog(
      SuccessDialog(
        title: 'Éxito',
        description: 'La información se cambió.',
        function: () {
          Get.back();
        },
      ),
    );
  }

  _errorInformation() {
    Get.dialog(
      ErrorDialog(
        title: 'Error',
        description: 'Ha habido un error.',
        function: () {
          Get.back();
        },
      ),
    );
  }
}
