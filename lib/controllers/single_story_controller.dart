import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/controllers/map_controller.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/user_service.dart';
import 'dart:developer';

class SingleStoryController extends GetxController {
  final UserService _userService = UserService();
  AppUser appUser = Get.find<AuthController>().appUser;
  final RxBool _isLike = false.obs;

  bool get isLike => _isLike.value;

  final RxBool _reload = false.obs;

  bool get reload => _reload.value;

  final Story story = Get.arguments;

  @override
  void onReady() async {
    Story story = Get.arguments;
    _isLike.value = await _userService.checkLike(story, appUser);
    super.onReady();
  }

  Future likeStory() async {
    await _userService.likeStory(story, appUser);
    _isLike.value = true;
    _reload.value = true;
  }

  Future dislikeStory() async {
    await _userService.dislikeStory(story, appUser);
    _isLike.value = false;
    _reload.value = true;
  }

  Future<bool> checkCoordinates() async {
    Get.lazyPut<MapController>(() => MapController());
    final mapController = Get.find<MapController>();
    await mapController.getUserLocation();
    if(mapController.locationPosition.latitude != (story.geoPoint!.latitude + 0.0000004) && mapController.locationPosition
        .longitude != (story.geoPoint!.longitude + 0.00004) || mapController.locationPosition.latitude == (story.geoPoint!
        .latitude + 0.00004) && mapController.locationPosition
        .longitude != (story.geoPoint!.longitude + 0.00004) || mapController.locationPosition.latitude != (story.geoPoint!.latitude + 0.00004) && mapController.locationPosition
        .longitude == (story.geoPoint!.longitude + 0.00004)){
      // mapController.dispose();
      return false;
    }
    // mapController.dispose();
    return true;
  }
}
