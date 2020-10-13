import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = "/about-us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            // decoration: BoxDecoration(gradient: testGradient),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Higher Secondary Plus One/Plus Two /NEET /JEE chaptewise Video classes, Study Notes, SCERT/NCERT Study Materials Kerala Higher Secondary Plus One/Plus Two Study Materials, Class 11 NCERT/SCERT Study Notes, Class 12 NCERT/SCERT Study Notes, DHSE Previous Questions Answer Key, Higher Secondary plus one plus two online Text Books are in one single app",
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ],
            )),
      ),
    );
  }
}
