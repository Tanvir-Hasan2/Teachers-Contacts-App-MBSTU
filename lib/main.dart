import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachers_contact_book_mbstu/Screens/caro_slider.dart';
import 'Screens/add_contact_page.dart';
import 'Screens/check_users.dart';
import 'Screens/home.dart';
import 'Screens/login_page.dart';
import 'Screens/sign_up_page.dart';
import 'Screens/splash_screen.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts App',
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade800),
        useMaterial3: true,
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

