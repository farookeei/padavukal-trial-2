import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';

import 'providers/course.dart';
import 'providers/user.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/chapDetails/chapDetails.dart';
import 'screens/chapter_overview/chapterOverview_screen.dart';
import 'screens/course_screen/courses_screen.dart';
import 'screens/home/homeScreen.dart';
import 'screens/onboardscreen/onboard_screen.dart';
import 'screens/otp_screen/otp_screen.dart';
import 'screens/profileScreen/profile_screen.dart';
import 'screens/razorpay/razorpay.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'screens/tabsScreen/tabs_screen.dart';
import 'screens/test_analytics/test_analytics_screen.dart';
import 'screens/test_description/test_description.dart';
import 'screens/test_overview/test_overview.dart';
import 'screens/test_page/testpage.dart';
import 'styles/styles.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[100], // status bar color
    ));
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
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          RazorPay.routeName: (ctx) => RazorPay(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case TestDescription.routeName:
              return MaterialPageRoute(
                builder: (context) => TestDescription(
                  testInfo: settings.arguments,
                ),
              );
            case TestPage.routeName:
              return MaterialPageRoute(
                builder: (context) => TestPage(
                  testInfo: settings.arguments,
                ),
              );
            case TestAnalyticsScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => TestAnalyticsScreen(
                  questions: settings.arguments,
                ),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
