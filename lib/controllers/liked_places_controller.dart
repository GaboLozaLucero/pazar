import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/user_service.dart';

class LikedPlacesController extends GetxController{
  final UserService _userService = UserService();
  AppUser appUser = Get.find<AuthController>().appUser;
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  final RxList<Story> _listStories = <Story>[].obs;

  List<Story> get listStories => _listStories.value;

  @override
  void onReady() async {
    await retrieveStories();
    super.onReady();
  }

  Future retrieveStories () async{
    _loading.value = true;
    final result = await _userService.retrieveLikedStories(appUser.uid!);
    _listStories.value = result!;
    _loading.value = false;
  }
}