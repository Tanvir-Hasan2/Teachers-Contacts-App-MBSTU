import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, "/checkUser");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/mbstu.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 30),
              const Text(
                "MBSTU Phone Book",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "MBSTU",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 180,
              ),

              const Text(
                "Developed by Tarikul&Akash",
                style: TextStyle(fontSize: 20, letterSpacing: 3,fontWeight: FontWeight.bold,color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Dept. of ICT, MBSTU",
                style: TextStyle(fontSize: 20, letterSpacing: 2,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
