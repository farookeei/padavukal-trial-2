import 'package:flutter/material.dart';
import 'package:padavukal/screens/auth/login_screen.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';

class OnboardScreen extends StatelessWidget {
  static const routeName = "/onboard-screen";

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset(
              "assets/images/onboardtop.png",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                // onPageChanged: (int page) {
                //   setState(() {
                //     _currentPage = page;
                //   });
                // },
                children: [
                  OnboardItem(
                    title: "Best Teacher",
                    subtitle: "Learning made easy",
                    imageUrl: "assets/images/onboard1.png",
                  ),
                  OnboardItem(
                    title: "LFH",
                    subtitle: "Learn From Home",
                    imageUrl: "assets/images/onboard3.png",
                  ),
                  // OnboardItem(
                  //   title: "Study Online",
                  //   subtitle:
                  //       "Study online means you can study anywhere,anytime",
                  //   imageUrl: "assets/images/onboard1.png",
                  // ),
                ],
              ),
            ),
            BlueButton(
              title: "Skip",
              width: 100,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            )
          ]),
        ),
      ),
    );
  }
}

// "assets/images/onboard1.png"      "Best Teacher"   "Learning made easy"
class OnboardItem extends StatelessWidget {
  final String title, subtitle, imageUrl;

  OnboardItem({this.title, this.subtitle, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          height: MediaQuery.of(context).size.height / 2.4,
        ),
        Text(
          title,
          style: onboardTitleStyle,
        ),
        Text(
          subtitle,
          style: onboardSubitleStyle,
        ),
      ],
    );
  }
}
