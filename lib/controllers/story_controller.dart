import 'package:get/get.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/stories_service.dart';

class StoryController extends GetxController{
  final StoriesService _storiesService = StoriesService();

  final RxList<Story> _listStories = <Story>[].obs;

  List<Story> get listStories => _listStories.value;

  final RxBool _loading = false.obs;
  bool get loading => _loading.value;

  Future retrieveStories(String collectionPath) async {
    _loading.value = true;
    final result = await _storiesService.retrieveStories(collectionPath);
    _listStories.value = result!;
    _loading.value = false;
  }
}