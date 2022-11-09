import 'package:get/get.dart';
import 'package:project/controllers/single_story_controller.dart';

class SingleStoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SingleStoryController(), fenix: true);
  }
}