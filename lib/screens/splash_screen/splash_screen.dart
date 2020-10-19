import 'dart:async';

import 'package:flutter/material.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/onboardscreen/onboard_screen.dart';
import 'package:padavukal/screens/tabsScreen/tabs_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(Duration(seconds: 30), () async {
      bool _result = await Provider.of<UserProvider>(context, listen: false)
          .checkCurrentUser();

      if (_result) {
        Navigator.pushReplacementNamed(context, TabsScreen.routeName);
        return;
      }
      Navigator.pushReplacementNamed(context, OnboardScreen.routeName);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "assets/images/padavukal.jpg",
        scale: 2.3,
      )),
    );
  }
}
