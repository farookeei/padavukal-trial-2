import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/models/quiz/question.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';
import 'package:padavukal/screens/test_analytics/widgets/bottom_container.dart';
import 'package:padavukal/screens/test_analytics/widgets/chart.dart';
import 'package:padavukal/screens/test_analytics/widgets/result_bar.dart';

class TestAnalyticsScreen extends StatefulWidget {
  static const routeName = "/test-analytics";

  final List<Question> questions;

  const TestAnalyticsScreen({
    Key key,
    @required this.questions,
  }) : super(key: key);

  @override
  _TestAnalyticsScreenState createState() => _TestAnalyticsScreenState();
}

class _TestAnalyticsScreenState extends State<TestAnalyticsScreen> {
  int total = 0, correct = 0, wrong = 0, unattempted = 0;

  @override
  void initState() {
    widget.questions.forEach((element) {
      print(element.selectedAnswer);
      if (element.selectedAnswer == "") {
        unattempted++;
      } else {
        if (element.selectedAnswer == element.answer)
          correct++;
        else
          wrong++;
      }
    });

    total = widget.questions.length;
    print("Total : $correct/$total Unattempted : $unattempted");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: PopupButton(),
          centerTitle: true,
          title: Text(
            "Analytics Page",
            style: blackappbartext,
          ),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overview",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: deviceSize.width * 0.09),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        children: [
                          ResultBar(
                            color: Colors.red,
                            count: wrong,
                            text: "Wrong",
                          ),
                          SizedBox(height: deviceSize.height * 0.01),
                          ResultBar(
                            color: Colors.green,
                            count: correct,
                            text: "Correct",
                          ),
                          SizedBox(height: deviceSize.height * 0.01),
                          ResultBar(
                              color: Colors.grey,
                              count: unattempted,
                              text: "Unanswered"),
                          SizedBox(height: deviceSize.height * 0.01),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      flex: 4,
                      child: Chart(
                        correct: correct,
                        total: total,
                        unattempted: unattempted,
                        wrong: wrong,
                      ),
                    )
                  ],
                ),
              ),
              BlueButton(
                title: "Answer  Key & Solution",
                width: 400,
                onPressed: () {},
              ),
              SizedBox(height: deviceSize.width * 0.09),
              Text(
                "Analytics",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: deviceSize.width * 0.09),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomContainer(
                      text1: "30",
                      text2: "Score",
                      icon: MdiIcons.trophyVariant,
                    ),
                    BottomContainer(
                      text1: "30s",
                      text2: "Pre questions",
                      icon: MdiIcons.timelapse,
                    ),
                    BottomContainer(
                      text1: "23m",
                      text2: "total time",
                      icon: MdiIcons.clockOutline,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}
