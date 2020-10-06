import 'dart:async';

import 'package:flutter/material.dart';
import 'package:padavukal/screens/onboardscreen/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, OnboardScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/images/padavukal 1.png",
        scale: 1.5,
      )),
    );
  }
}
