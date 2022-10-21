import 'package:get/get.dart';
import 'package:project/controllers/legends_controller.dart';

class LegendsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LegendsController>(() => LegendsController(), fenix: true);
  }

}