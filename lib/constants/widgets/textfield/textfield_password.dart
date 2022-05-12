import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:project/constants/contant_colors.dart';
import 'package:project/constants/size_form.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'El campo debe ser llenado';
            }
            return null;
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
            fillColor: ConstantColors.inputTextColor,
            suffixIcon: Icon(icon, color: Colors.black,)
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
