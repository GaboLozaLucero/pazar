import 'package:get/get.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/services/user_api.dart';
import 'dart:developer';

class SignedUpController extends GetxController {
  final UserAPI _userAPI = UserAPI();

  Future<bool> registerUser(AppUser appUser) async {
    //log(appUser.name.toString());
    bool isCreated = false;
    if (appUser != null) {
      isCreated = await _userAPI.createUser(appUser);
      return isCreated;
    }
    return isCreated;
  }
}
