import 'package:get/get.dart';
import 'package:project/controllers/stories_controller.dart';

class StoriesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoriesController(), fenix: true);
  }

}