import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padavukal/screens/chapDetails/chapDetails.dart';
import 'package:padavukal/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:padavukal/screens/course_screen/courses_screen.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/auth/login_screen.dart';
import 'package:padavukal/screens/auth/signup_screen.dart';
import 'package:padavukal/screens/home/homeScreen.dart';
import 'package:padavukal/screens/onboardscreen/onboard_screen.dart';
import 'package:padavukal/screens/otp_screen/otp_screen.dart';
import 'package:padavukal/screens/profileScreen/profile_screen.dart';
import 'package:padavukal/screens/razorpay/razorpay.dart';
import 'package:padavukal/screens/test_analytics/test_analytics_screen.dart';
import 'package:padavukal/screens/test_description/test_description.dart';
import 'package:padavukal/screens/test_overview/test_overview.dart';
import 'package:padavukal/screens/test_page/testpage.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/screens/tabsScreen/tabs_screen.dart';

import 'screens/chapter_overview/chapterOverview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE,
    );
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CourseProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themes(),
        home: SplashScreen(),
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          OnboardScreen.routeName: (ctx) => OnboardScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignIn.routeName: (ctx) => SignIn(),
          OtpScreen.routeName: (ctx) => OtpScreen(),
          CourseScreen.routeName: (ctx) => CourseScreen(),
          ChapterOverView.routeName: (ctx) => ChapterOverView(),
          ChapDetails.routeName: (ctx) => ChapDetails(),
          TestOverviewScreen.routeName: (ctx) => TestOverviewScreen(),
          TestDescription.routeName: (ctx) => TestDescription(),
          TestAnalyticsScreen.routeName: (ctx) => TestAnalyticsScreen(),
          TestPage.routeName: (ctx) => TestPage(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          RazorPay.routeName: (ctx) => RazorPay(),
        },
      ),
    );
  }
}
