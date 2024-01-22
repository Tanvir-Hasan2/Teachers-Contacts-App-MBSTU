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
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, "/checkUser");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/mbstu.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 30),
            Text(
              "Teachers Contact Book",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "MBSTU",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 200,
            ),
            Text("from",style: TextStyle(fontSize: 25,color: Colors.black),),
            SizedBox(
              height: 15,
            ),
            Text(
              "T&S Group",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.blue),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
