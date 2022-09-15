import 'package:get/get.dart';
import 'package:project/bindings/auth_binding.dart';
import 'package:project/ui/auth_page.dart';
import 'package:project/ui/sign_in_page.dart';
import 'package:project/ui/sign_up_page.dart';
import 'package:project/ui/home_page.dart';

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
  ];
}
