import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/bindings/auth_binding.dart';
import 'package:project/navigation/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/ui/sign_in_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aclonicaTextTheme(),
      ),
      defaultTransition: Transition.rightToLeft,
      initialBinding: AuthBinding(),
      home: SignInPage(),
      /*Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: Get.height*0.2,
              color: Colors.white,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF6a8d73),)),
            ),
            Container(
              height: Get.height*0.2,
              color: Colors.white,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF4e4a59)),
            ),),
            Container(
              height: Get.height*0.2,
              color: Colors.green,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF4e4a59))),
            ),
            Container(
              height: Get.height*0.2,
              color: Colors.yellow,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF4e4a59))),
            ),
            Container(
              height: Get.height*0.2,
              color: Colors.brown,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF4e4a59))),
            ),
          ],
        ),
      ),*/
      getPages: Pages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
