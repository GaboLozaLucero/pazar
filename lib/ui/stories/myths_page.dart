import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/stories_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/card/story_card.dart';
import 'dart:developer';

import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';

class MythsPage extends GetView<StoriesController> {
  const MythsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'mitos'),
        body: GetX<StoriesController>(
          initState: (state) async {
            await controller.retrieveStories('myths');
          },
          builder: (controlling) {
            if (controlling.loading) {
              return const CircularLoadingIndicator(text: 'Cargando mitos');
            }
            return StoryCard(
              stories: controlling.listStories,
              function: (index) {
                Story story = controlling.listStories[index];
                log('this is what i got: ${controlling.listStories[index]}');
                Get.toNamed(Routes.story, arguments: story);
              },
            );
          },
        ),
      ),
    );
  }
}
