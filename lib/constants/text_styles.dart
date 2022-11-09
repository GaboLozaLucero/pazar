import 'package:flutter/material.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';

TextStyle textFormFieldTitleStyle = const TextStyle(
  color: ConstantColors.textFieldTitleColor,
  fontSize: SizeForm.textFieldTitleSize,
  overflow: TextOverflow.fade,
);

TextStyle textInButtonStyle = const TextStyle(
  color: ConstantColors.inputTextButtonColor,
  fontSize: SizeForm.textInButtonSize,
  overflow: TextOverflow.fade,
);

TextStyle textInMainCard = const TextStyle(
  color: Colors.black,
  fontSize: SizeForm.textTitleSize,
  overflow: TextOverflow.fade,
);

TextStyle textInDescriptionCard = const TextStyle(
  color: ConstantColors.inputTextButtonColor,
  fontSize: SizeForm.textDescriptionSize,
  overflow: TextOverflow.fade,
);

TextStyle textTitle = const TextStyle(
  color: ConstantColors.appBarTextColor,
  fontSize: SizeForm.textTitleSize,
  overflow: TextOverflow.fade,
);

TextStyle textCardStories = const TextStyle(
  color: Colors.white,
  fontSize: SizeForm.textCardStoriesSize,
  overflow: TextOverflow.fade,
);

TextStyle textTitleStories = const TextStyle(
  color: Colors.black,
  fontSize: SizeForm.textTitleSize,
  fontWeight: FontWeight.bold
);