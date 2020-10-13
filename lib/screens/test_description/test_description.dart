import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/models/testmodel.dart';
import 'package:padavukal/screens/test_page/testpage.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';

class TestDescription extends StatelessWidget {
  static const routeName = "/test-desc";

  final TestModel testInfo;

  const TestDescription({Key key, @required this.testInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    Widget buildIcons(IconData icon, int number, String text) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.283,
        height: _height * 0.08,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$number",
                  style: testdesc,
                ),
                Text(
                  text,
                  style: testdesc2,
                )
              ],
            )
          ],
        ),
      );
    }

    Widget _buildInstructions() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instructions",
              style: chapheading,
            ),
            SizedBox(height: _height * 0.012),
            Text("*  Mulitple choice questons", style: chapsubheading),
            Text("*  Correct answers will get 4.0 marks",
                style: chapsubheading),
            Text("*  Not attended questions will get no marks",
                style: chapsubheading),
            Text("*  Wrong answer will be negative 1.0 marks",
                style: chapsubheading),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          leading: PopupButton(),
          centerTitle: true,
          title: Text(
            "Model Exam",
            style: blackappbartext,
          ),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIcons(MdiIcons.bookAccount, 240, "Questions"),
                  buildIcons(MdiIcons.clockFast, 150, "Minutes"),
                  buildIcons(MdiIcons.medal, 500, "Marks")
                ],
              ),
              _buildInstructions(),
              SizedBox(height: _height * 0.08),
              Center(
                  child: Image.asset("assets/images/testdesc.png", scale: 3)),
              SizedBox(height: _height * 0.03),
              Center(
                child: BlueButton(
                  title: "Start Exam",
                  width: 150,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      TestPage.routeName,
                      arguments: testInfo,
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
