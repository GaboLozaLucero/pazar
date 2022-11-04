import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/controllers/story_controller.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/card/story_card.dart';

class LegendsPage extends GetView<StoryController> {
  const LegendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Leyendas'),
        body: GetX<StoryController>(
          initState: (state) async{
            await controller.retrieveStories('legends');
          },
          builder: (controlling) {if (controlling.loading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Cargando leyendas')
                ],
              ),
            );
          }
            return StoryCard(
              stories: controlling.listStories,
              function: (index) {
                Get.toNamed(Routes.story, arguments: controlling.listStories[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
