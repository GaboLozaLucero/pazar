import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'El campo debe ser llenado';
            } else if (value.isEmail) {
              return null;
            }
            return 'No es un correo válido';
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeForm.textFieldRadius),
              borderSide: const BorderSide(
                color: ConstantColors.textFieldFocusColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeForm.textFieldRadius),
              borderSide: const BorderSide(
                color: ConstantColors.textFieldFocusColor,
              ),
            ),
            filled: true,
            fillColor: ConstantColors.inputTextFieldColor,
            suffixIcon: Icon(icon, color: Colors.black,),
          ),
          cursorHeight: SizeForm.cursorHeight,
          cursorColor: ConstantColors.inputCursorColor,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
