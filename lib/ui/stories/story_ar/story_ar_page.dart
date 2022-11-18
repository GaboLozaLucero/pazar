import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/story_ar_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';

class StoryArPage extends GetView<StoryArController> {
  StoryArPage({Key? key}) : super(key: key);

  final _story = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppbar(title: ''),
      body: ARView(onARViewCreated: controller.onARViewCreated),
      floatingActionButton: ElevatedButton(
        onPressed: controller.onWebObjectAtOriginButtonPressed,
        child: const Text("Add/Remove Web\nObject at Origin"),
      ),
    ),
    );
  }
}
