import 'package:get/get.dart';
import 'package:project/controllers/map_controller.dart';

class StoryMapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MapController(), fenix: true);
  }
}