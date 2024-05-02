import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/add_contact_page.dart';
import 'Views/caro_slider.dart';
import 'controllers/check_users.dart';
import 'Views/home.dart';
import 'Views/login_page.dart';
import 'Views/sign_up_page.dart';
import 'Views/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MBSTU Phone Book',
      theme: ThemeData(
        textTheme: GoogleFonts.exo2TextTheme(),
       primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "/checkUser": (context) => CheckUser(),
        "/home": (context) => Homepage(),
        "/signup": (context) => SignUpPage(),
        "/login": (context) => LoginPage(),
        "/add": (context) => AddContact(),
        "/caro": (context) => CarouSlider()
      },
    );
  }
}

