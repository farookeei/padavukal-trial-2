import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/models/testmodel.dart';
import 'package:padavukal/screens/test_analytics/test_analytics_screen.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';
import 'package:padavukal/screens/test_page/widgets/question_card.dart';
import 'package:padavukal/screens/test_page/widgets/testbuttons.dart';

class TestPage extends StatelessWidget {
  static const routeName = "/test-page";

  final TestModel testInfo;

  const TestPage({Key key, @required this.testInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: PopupButton(),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: BlueButton(
              title: "Submit",
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, TestAnalyticsScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(MdiIcons.noteOutline),
                    Text("1/100"),
                  ],
                ),
                Row(
                  children: [
                    Icon(MdiIcons.clockTimeFive),
                    Text("149.56"),
                  ],
                )
              ],
            ),

            ///
            QuestionCard(deviceSize: deviceSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttons(
                  icon: MdiIcons.chevronLeft,
                  text: "Back",
                ),
                Buttons(
                  icon: MdiIcons.chevronRight,
                  text: "Next",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
