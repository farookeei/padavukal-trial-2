import 'package:flutter/material.dart';
import 'package:padavukal/controller/courseController/courseController.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/coursemodel.dart';
import 'package:padavukal/providers/models/user_model.dart.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/razorpay/razorpay.dart';
import 'package:padavukal/screens/tabsScreen/tabs_screen.dart';
import 'package:padavukal/widgets/loading/loading.dart';
import 'package:provider/provider.dart';
import 'widgets/gradient_button.dart';

class CourseScreen extends StatefulWidget {
  static const routeName = "/courses";

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;
  int count = 1;
  List<CourseModel> _courseData;
  String loadingMessgaes = 'Loading Course';

  Future<void> searchExpire() async {
    CourseController _courseController = CourseController(
      context: context,
      scaffoldKey: _scaffoldKey,
    );
    setState(() {
      _isLoading = true;
      loadingMessgaes = 'verify user';
    });
    try {
      dynamic _verificationResult = await _courseController.validateCourse();
      setState(() => _isLoading = false);
      print("object");
      print(_verificationResult);
      if (_verificationResult.toString().contains("id")) {
        Navigator.of(context).pushNamed(TabsScreen.routeName);
      }
      if (_verificationResult['expried'] == 'Your plan is expried') {
        Navigator.of(context).pushNamed(RazorPay.routeName);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchFromServer() async {
    _courseData = await Provider.of<CourseProvider>(context, listen: false)
        .retrieveService();
    setState(() => _isLoading = false);
  }

  @override
  void didChangeDependencies() {
    if (count == 1) {
      count = 2;
      fetchFromServer();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          User currentUser =
              Provider.of<UserProvider>(context, listen: false).currentUser;

          await Provider.of<CourseProvider>(context, listen: false)
              .retrieveTest(userToken: currentUser.token, id: 1);
          await Provider.of<CourseProvider>(context, listen: false)
              .retrieveQuestions(userToken: currentUser.token, id: 1);
        },
        child: Icon(
          Icons.ac_unit,
        ),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Courses", style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 10),
              _isLoading
                  ? Center(child: LoadingWidget(title: loadingMessgaes))
                  : Container(
                      width: screenWidth * 0.7,
                      child: ListView.builder(
                        itemCount: _courseData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GradientButton(
                            title: _courseData[index].title,
                            color: Colors.white,
                            onPressed: searchExpire,
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
