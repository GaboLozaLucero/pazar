import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/story_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/card/story_card.dart';
import 'dart:developer';

class MythsPage extends GetView<StoryController> {
  const MythsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Mitos'),
        body: GetX<StoryController>(
          initState: (state) async {
            await controller.retrieveStories('myths');
          },
          builder: (controlling) {
            if (controlling.loading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator(), Text('Cargando leyendas')],
                ),
              );
            }
            return StoryCard(
              stories: controlling.listStories,
              function: (index) {
                Story story = controlling.listStories[index];
                log('address: ${story.address}');

              },
            );
          },
        ),
      ),
    );
  }
}
