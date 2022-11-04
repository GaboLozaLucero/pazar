import 'package:get/get.dart';
import 'package:project/controllers/story_controller.dart';

class StoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoryController(), fenix: true);
  }

}