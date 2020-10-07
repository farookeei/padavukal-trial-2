import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/testmodel.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/test_analytics/test_analytics_screen.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';
import 'package:padavukal/screens/test_page/widgets/question_card.dart';
import 'package:padavukal/screens/test_page/widgets/testbuttons.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  static const routeName = "/test-page";

  final TestModel testInfo;

  const TestPage({Key key, @required this.testInfo}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CourseProvider courseProvider;
  UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    userProvider = Provider.of<UserProvider>(context, listen: false);
    courseProvider = Provider.of<CourseProvider>(context, listen: false);

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

            /// TODO : Adding loading here load the data then use your QuestionCard widget to show the questions
            ///
            /// The retriveQuestions method will return a [List<Question>] which will include `question`/ `answer `&
            /// 4choices named as `choiceA`,`choiceB`,`choiceC`,`choiceD`
            ///
            /// Add those as the choice and check if the selected choice is same as answer
            QuestionCard(deviceSize: deviceSize),

            /// NOTE : Try to use futureBuilder for better perfomance

            // FutureBuilder(
            //   future: courseProvider.retrieveQuestions(
            //     userToken: userProvider.currentUser.token,
            //     id: widget.testInfo.id,
            //   ),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     print(
            //       "State : ${snapshot.connectionState} Body : ${snapshot.data}",
            //     );

            //     INFO : Edit your question card to include the data of questions
            //     return QuestionCard(deviceSize: deviceSize);
            //   },
            // ),

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
