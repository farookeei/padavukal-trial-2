import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/course.dart';
import '../../providers/models/subject_model.dart';
import '../../providers/models/testmodel.dart';
import '../../providers/user.dart';
import '../../styles/styles.dart';
import '../home/widgets/testcontainer.dart';
import 'widgets/test_items.dart';

class TestOverviewScreen extends StatefulWidget {
  static const routeName = "/test-overview";
  @override
  _TestOverviewScreenState createState() => _TestOverviewScreenState();
}

class _TestOverviewScreenState extends State<TestOverviewScreen> {
  SubjectModel _currentSubject = SubjectModel(
    id: -1,
    name: "",
  );
  CourseProvider courseProvider;
  UserProvider userProvider;

  List<TestModel> tests = [];
  bool loading = false;

  /// TODO: NOT A GOOD SOLUTION SHOULD CHANGE LATER
  getTests() async {
    setState(() {
      loading = true;
    });
    _currentSubject = courseProvider.currentSubject;
    tests = await courseProvider.retrieveTest(
      userToken: userProvider.currentUser.token,
      id: _currentSubject.id,
    );
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    courseProvider = Provider.of<CourseProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    if (courseProvider.currentSubject != _currentSubject) getTests();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TestContainer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subjects",
                      style: chapheading,
                    ),
                    SizedBox(height: _height * 0.008),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: testGradient,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<SubjectModel>(
                                value: courseProvider.currentSubject,
                                items: courseProvider.subjectData
                                    .map<DropdownMenuItem<SubjectModel>>(
                                      (e) => DropdownMenuItem<SubjectModel>(
                                        child: Text(e.name),
                                        value: e,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    courseProvider.setcurrentSubject(value);
                                    print(value);
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _height * 0.02),
                    loading
                        ? CircularProgressIndicator()
                        : TestItemsWidget(
                            currentSubject: _currentSubject,
                            tests: tests,
                            height: _height,
                          ),
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
