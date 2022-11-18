import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/map_controller.dart';
import 'package:project/controllers/single_story_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'dart:developer';
import 'package:project/ui/widgets/button/floating_story_button.dart';

class SingleStoryPage extends GetView<SingleStoryController> {
  SingleStoryPage({Key? key}) : super(key: key);

  final Story _story = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: ''),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.2,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage('${_story.imageUrl}'),
              //     fit: BoxFit.fill,
              //     alignment: Alignment.center,
              //   ),
              // ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    '${_story.imageUrl}',
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: ConstantColors.buttonColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(SizeForm.margin / 4),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(SizeForm.textBackgroundRadius),
                        ),
                        child: Text(
                          '${_story.address}',
                          textAlign: TextAlign.right,
                          style: textInDescriptionCard,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 12.0, right: 2.0, left: 2.0),
              child: Text(
                '${_story.name}',
                style: const TextStyle(
                  color: ConstantColors.textTitleStoryColor,
                  fontSize: SizeForm.textTitleSize,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '${_story.story}',
                    textStyle: const TextStyle(
                      fontSize: SizeForm.textStoriesSize,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                    // overflow: TextOverflow.visible,
                    // softWrap: true,
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() => (controller.isLike)
                ? FloatingStoryButton(
                    iconData: Icons.thumb_up_off_alt_rounded,
                    function: () {
                      controller.dislikeStory(_story);
                    },
                  )
                : FloatingStoryButton(
                    iconData: Icons.thumb_up_alt_outlined,
                    function: () {
                      controller.likeStory(_story);
                    },
                  )),
            FloatingStoryButton(
              iconData: Icons.map_outlined,
              function: () {
                Get.toNamed(Routes.storyMap, arguments: _story);
              },
            ),
            FloatingStoryButton(
              iconData: Icons.camera_alt_outlined,
              function: () async {
                // Get.lazyPut<MapController>(() => MapController());
                // final mapController = Get.find<MapController>();
                // await mapController.getUserLocation();
                // log('${mapController.locationPosition}');
                Get.toNamed(Routes.storyAr, arguments: _story);
              },
            ),
          ],
        ),
      ),
    );
  }
}
