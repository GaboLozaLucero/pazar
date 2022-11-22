import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/story_ar_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';

class StoryArPage extends GetView<StoryArController> {
  StoryArPage({Key? key}) : super(key: key);

  final _story = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: ''),
        body: Stack(
          children: [
            ARView(
              onARViewCreated: controller.onARViewCreated,
              planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
            ),
            // SizedBox(
            //   height: Get.height,
            //   width: double.infinity,
            //   child:
            //   OutlinedButton(
            //     style: OutlinedButton.styleFrom(
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeForm.buttonRadius),),
            //       side: const BorderSide(
            //         width: 2,
            //         color: ConstantColors.floatingSideButtonColor,
            //       ),
            //       alignment: Alignment.center,
            //       padding: const EdgeInsets.all(SizeForm.margin / 1.5),
            //     ),
            //     onPressed: controller.onWebObjectAtOriginButtonPressed,
            //     child: Text('representación'.toUpperCase(), style: textInMainCard),
            //   ),
            // )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeForm.buttonRadius),),
            side: const BorderSide(
              width: 2,
              color: ConstantColors.floatingSideButtonColor,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(SizeForm.margin / 1.5),
          ),
          onPressed: controller.onWebObjectAtOriginButtonPressed,
          child: Text('representación'.toUpperCase(), style: textInMainCard),
        ),
      ),
    );
  }
}
