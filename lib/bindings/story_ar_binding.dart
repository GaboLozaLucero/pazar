import 'package:get/get.dart';
import 'package:project/controllers/story_ar_controller.dart';

class StoryArBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoryArController(), fenix: true);
  }
}