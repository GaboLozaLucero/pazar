import 'package:get/get.dart';
import 'package:project/controllers/popular_places_controller.dart';

class PopularPlacesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PopularPlacesController(), fenix: true);
  }
}