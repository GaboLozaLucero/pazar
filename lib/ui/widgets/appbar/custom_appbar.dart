import 'package:flutter/material.dart';
import 'package:project/constants/text_styles.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title.toUpperCase(),
        style: textTitle,
      ),
      // shape: ShapeBorder(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
