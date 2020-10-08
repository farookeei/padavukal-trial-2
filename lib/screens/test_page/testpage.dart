import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/course.dart';
import '../../providers/models/quiz/question.dart';
import '../../providers/models/testmodel.dart';
import '../../providers/user.dart';
import '../../widgets/buttons/BlueButton.dart';
import '../../widgets/buttons/popbutton.dart';
import '../test_analytics/test_analytics_screen.dart';
import 'widgets/question_card.dart';
import 'widgets/testbuttons.dart';

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

  PageController _pageController;
  int index = 0;
  int len = 0;

  bool loading = false;
  List<Question> questions;

  setLoadingState() => setState(() => loading = !loading);

  getAllQuestions() async {
    setLoadingState();

    questions = await courseProvider.retrieveQuestions(
      userToken: userProvider.currentUser.token,
      id: widget.testInfo.id,
    );

    len = questions.length;
    setLoadingState();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: index, keepPage: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    courseProvider = Provider.of<CourseProvider>(context, listen: false);

    if (questions == null) getAllQuestions();

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
                if (questions != null) {
                  Navigator.pushReplacementNamed(
                    context,
                    TestAnalyticsScreen.routeName,
                    arguments: questions,
                  );
                }
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
                    Text("${index + 1}/$len"),
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

            /// NOTE : Try to use futureBuilder for better perfomance

            !loading
                ? Expanded(
                    flex: 1,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) => setState(() => index = value),
                      itemBuilder: (context, index) => QuestionCard(
                        question: questions[index],
                      ),
                      itemCount: questions.length,
                    ),
                  )
                : CircularProgressIndicator(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttons(
                  icon: MdiIcons.chevronLeft,
                  text: "Back",
                  onPress: () {
                    if (index > 0) {
                      setState(() {
                        index--;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
                Buttons(
                  icon: MdiIcons.chevronRight,
                  text: "Next",
                  onPress: () {
                    if (index < len - 1) {
                      setState(() {
                        index++;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
