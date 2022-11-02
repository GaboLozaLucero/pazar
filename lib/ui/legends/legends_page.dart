import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/controllers/legends_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/card/story_card.dart';

class LegendsPage extends GetView<LegendsController> {
  const LegendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Leyendas'),
        body: GetX<LegendsController>(
          initState: (state) {
            controller.retrieveStories('legends');
          },
          builder: (controlling) {
            return StoryCard(stories: controlling.listStories,);
          },
        ),
      ),
    );
  }
}
