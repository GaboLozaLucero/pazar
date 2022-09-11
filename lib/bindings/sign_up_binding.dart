import 'package:get/get.dart';
import 'package:project/controllers/signed_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignedUpController>(() => SignedUpController(), fenix: true);
  }

}