import 'package:get/get.dart';
import 'package:project/ui/sign_in_page.dart';
import 'package:project/ui/sign_up_page.dart';
import 'package:project/ui/home_page.dart';
part './routes.dart';

class Pages{
  static final pages = [
    GetPage(name: Routes.signIn, page: () => SignInPage()),
    GetPage(name: Routes.signUp, page: () => const SignUpPage()),
    GetPage(name: Routes.homePage, page: () => const HomePage(),),
  ];
}