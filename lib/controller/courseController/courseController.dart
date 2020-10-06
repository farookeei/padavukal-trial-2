import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/user_model.dart.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/widgets/errornotifire/errorMessage.dart';
import 'package:provider/provider.dart';

class CourseController {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CourseController({
    @required this.context,
    @required this.scaffoldKey,
  });

  Future<dynamic> validateCourse() async {
    User currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    if (currentUser == null) {
      errorMessage(scaffold: scaffoldKey, message: 'User not found.');
      return null;
    }

    dynamic _verificationResult =
        await Provider.of<CourseProvider>(context, listen: false)
            .subjectVerfication(userToken: currentUser.token)
            .catchError((e) => errorMessage(
                scaffold: scaffoldKey, message: 'Error Ocuured in receiving.'));

    if (_verificationResult == null) {
      errorMessage(scaffold: scaffoldKey, message: 'Error Ocuured.');
      return null;
    }

    if (_verificationResult.isEmpty) {
      errorMessage(scaffold: scaffoldKey, message: 'Error Ocuured.');
      return null;
    }

    return _verificationResult;
  }
}
