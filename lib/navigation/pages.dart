// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:project/bindings/auth_binding.dart';
import 'package:project/bindings/map_binding.dart';
import 'package:project/bindings/story_binding.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/ui/auth_page.dart';
import 'package:project/ui/stories/legends_page.dart';
import 'package:project/ui/map/map_page.dart';
import 'package:project/ui/sign_in_page.dart';
import 'package:project/ui/sign_up_page.dart';
import 'package:project/ui/home_page.dart';
import 'package:project/ui/stories/myths_page.dart';

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
      binding: StoryBinding(),
    ),
    GetPage(
      name: Routes.legends,
      page: () => LegendsPage(),
      binding: StoryBinding(),
    ),
  ];

  static get story => null;
}
