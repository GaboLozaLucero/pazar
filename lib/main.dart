import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        // appBarTheme: AppBarTheme()
      ),defaultTransition: Transition.rightToLeft,
      home: SignInPage(),
      getPages: Pages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}