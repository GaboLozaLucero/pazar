import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Color appColor = const Color(0xFF373752);
    Color backArrow = const Color(0xFFF6B05C);
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: textTitle,
      ),
      backgroundColor: ConstantColors.appBarBackgroundColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(SizeForm.appBarRadius),
        ),
      ),
      leading: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 0.0,
              style: BorderStyle.none,
            ),
          ),
          shadowColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: backArrow,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
