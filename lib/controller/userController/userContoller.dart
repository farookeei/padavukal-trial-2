import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/widgets/errornotifire/errorMessage.dart';
import 'package:provider/provider.dart';

class UserController {
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey;

  UserController({
    @required this.context,
    this.scaffoldKey,
  });

  Future<List> loginController({
    @required String userName,
    @required String password,
  }) async {
    Map<String, dynamic> user = {
      'username': userName,
      'password': password,
    };
    List _fetchData = await Provider.of<UserProvider>(context, listen: false)
        .login(body: user)
        .catchError((e) =>
            errorMessage(scaffold: scaffoldKey, message: 'Opps! Try again.'));
    print(_fetchData);
    return _fetchData;
  }

  Future<List> signupController({
    @required String userName,
    @required String password,
    @required String name,
    @required String email,
  }) async {
    Map<String, dynamic> user = {
      'username': userName,
      'password': password,
      'first_name': name,
      'email': email,
      'last_name': ''
    };
    List _fetchData = await Provider.of<UserProvider>(context, listen: false)
        .signUp(body: user)
        .catchError((e) =>
            errorMessage(scaffold: scaffoldKey, message: 'Opps! Try again.'));
    return _fetchData;
  }
}
