import 'package:flutter/material.dart';
import 'package:padavukal/screens/test_overview/test_overview.dart';
import 'package:padavukal/styles/styles.dart';

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, TestOverviewScreen.routeName),
      child: Container(
        margin: EdgeInsets.only(top: 0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: testGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Text("Take a Test now",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline5),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/pana.png",
                scale: MediaQuery.of(context).size.width * 0.012,
              ),
            )
          ],
        ),
      ),
    );
  }
}
