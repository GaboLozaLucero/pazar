import 'package:get/get.dart';
import 'package:project/controllers/liked_places_controller.dart';

class LikedPlacesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LikedPlacesController(), fenix:true);
  }
}