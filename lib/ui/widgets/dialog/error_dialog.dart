import 'package:flutter/material.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.title, required this.description, required this.function}) : super(key: key);

  final String title;
  final String description;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: textErrorDialog,),
      content: Text(description, style: textContentDialog,),
      actions: [
        CustomElevatedButton(
            color: ConstantColors.errorColor,
            onPress: () {
              function();
            },
            text: 'Ok'),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
      ),
    );
  }
}
