import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/popular_places_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/card/story_card.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';
import 'dart:developer';

class PopularPlacesPage extends GetView<PopularPlacesController> {
  const PopularPlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppbar(title: 'Populares'),
      body: GetX<PopularPlacesController>(
        initState: (state) async {
          await controller.retrievePopular();
        },
        builder: (controlling) {
          if (controlling.loading) {
            return const CircularLoadingIndicator(text: 'Cargando populares');
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
    ),);
  }
}
