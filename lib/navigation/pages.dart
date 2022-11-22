// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:project/bindings/auth_binding.dart';
import 'package:project/bindings/liked_places_binding.dart';
import 'package:project/bindings/map_binding.dart';
import 'package:project/bindings/popular_places_binding.dart';
import 'package:project/bindings/single_story_binding.dart';
import 'package:project/bindings/stories_binding.dart';
import 'package:project/bindings/story_ar_binding.dart';
import 'package:project/bindings/story_map_binding.dart';
import 'package:project/ui/auth_page.dart';
import 'package:project/ui/profile/liked_places_page.dart';
import 'package:project/ui/profile/popular_places/popular_places_page.dart';
import 'package:project/ui/profile/profile_information/profile_information_page.dart';
import 'package:project/ui/profile/profile_information/profile_password.dart';
import 'package:project/ui/profile/profile_page.dart';
import 'package:project/ui/stories/legends_page.dart';
import 'package:project/ui/map/map_page.dart';
import 'package:project/ui/sign_in_page.dart';
import 'package:project/ui/sign_up_page.dart';
import 'package:project/ui/home_page.dart';
import 'package:project/ui/stories/myths_page.dart';
import 'package:project/ui/stories/single_story_page.dart';
import 'package:project/ui/stories/story_ar/story_ar_page.dart';
import 'package:project/ui/stories/story_map/story_map.dart';

part './routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.map,
      page: () => MapPage(),
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.myths,
      page: () => MythsPage(),
      binding: StoriesBinding(),
    ),
    GetPage(
      name: Routes.legends,
      page: () => LegendsPage(),
      binding: StoriesBinding(),
    ),
    GetPage(
      name: Routes.story,
      page: () => SingleStoryPage(),
      binding: SingleStoryBinding(),
    ),
    GetPage(
      name: Routes.storyMap,
      page: () => StoryMap(),
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.profileInformation,
      page: () => ProfileInformationPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profilePassword,
      page: () => ProfilePassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.likedPlaces,
      page: () => LikedPlacesPage(),
      binding: LikedPlacesBinding(),
    ),
    GetPage(
      name: Routes.storyAr,
      page: () => StoryArPage(),
      binding: StoryArBinding(),
    ),
    GetPage(
      name: Routes.popularPlaces,
      page: () => PopularPlacesPage(),
      binding: PopularPlacesBinding(),
    ),
  ];
}
