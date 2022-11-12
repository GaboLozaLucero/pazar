import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/stories_service.dart';
import 'package:project/services/user_service.dart';

class SingleStoryController extends GetxController{
  final UserService _userService = UserService();
  AppUser appUser = Get.find<AuthController>().appUser;
  final RxBool _isLike = false.obs;

  bool get isLike => _isLike.value;

  final RxBool _reload = false.obs;
  bool get reload => _reload.value;

  @override
  void onReady() async {
    Story story = Get.arguments;
    _isLike.value = await _userService.checkLike(story, appUser);
    super.onReady();
  }

  Future likeStory(Story story) async{
    await _userService.likeStory(story, appUser);
    _isLike.value = true;
    _reload.value = true;
  }

  Future dislikeStory(Story story) async{
    await _userService.dislikeStory(story, appUser);
    _isLike.value = false;
    _reload.value = true;
  }
}