import 'package:flutter/material.dart';
import 'package:project/constants/size_form.dart';

class TextContainer extends StatelessWidget {
  TextContainer({Key? key, required this.text, required this.style}) : super(key: key);

  String text = '';
  TextStyle style = const TextStyle();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeForm.margin / 4),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(SizeForm.textBackgroundRadius),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
