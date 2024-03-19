import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/bindings/auth_binding.dart';
import 'package:project/navigation/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/ui/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aclonicaTextTheme(),
      ),
      defaultTransition: Transition.rightToLeft,
      initialBinding: AuthBinding(),
      home: const AuthPage(),
      getPages: Pages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
