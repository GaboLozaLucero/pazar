import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/liked_places_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_textbutton.dart';
import 'package:project/ui/widgets/card/story_card.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';

class LikedPlacesPage extends GetView<LikedPlacesController> {
  const LikedPlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Favoritos'),
      body: GetX<LikedPlacesController>(
        initState: (state) async {
          await controller.retrieveStories();
        },
        builder: (controlling) {
          if (controlling.loading) {
            return const CircularLoadingIndicator(text: 'Cargando mitos');
          }
          if (controller.listStories.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height*0.3,
                    child: Image.asset(
                      './././assets/images/empty-box.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  CustomTextButton(
                      text: 'No hay historias\nfavoritas',
                      onPress: () {
                        Get.offAllNamed(Routes.homePage);
                      }),
                ],
              ),
            );
          }
          return StoryCard(
            stories: controlling.listStories,
            function: (index) async {
              Story story = controlling.listStories[index];
              final result = await Get.toNamed(Routes.story, arguments: story);
              if (result == null) {
                controller.onReady();
              }
            },
          );
        },
      ),
    ));
  }
}
