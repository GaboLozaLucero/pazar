import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key? key,
    required this.controller,
    required this.title,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    double _height = Get.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textFormFieldTitleStyle,
        ),
        TextFormField(

          controller: controller,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'El campo debe ser llenado';
            }
            if(value.length < 6 ){
              return 'La contraseña debe tener al menos 6 caracteres';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
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
            fillColor: ConstantColors.backgroundInputTextFieldColor,
            suffixIcon: const Icon(
              Icons.key_outlined,
              color: Colors.black,
            ),
          ),
          cursorHeight: SizeForm.cursorHeight,
          cursorColor: ConstantColors.inputCursorColor,
          obscureText: true,
        ),
        SizedBox(
          height: _height * 0.02,
        ),
      ],
    );
  }
}
