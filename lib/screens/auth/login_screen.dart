import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/controller/userController/userContoller.dart';
import 'package:padavukal/screens/auth/signup_screen.dart';
import 'package:padavukal/screens/tabsScreen/tabs_screen.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';

// enum AuthMode { Signup, Login }

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Navigator.of(context).pushNamed(CourseScreen.routeName);
class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _obsureText = true;
  final BorderRadius _borderRadius = BorderRadius.all(Radius.circular(5));

  Map user = {'email': '', 'password': ''};

  void login() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);

      _formKey.currentState.save();
      UserController _userController = new UserController(
        context: context,
        scaffoldKey: _scaffoldKey,
      );
      // * connection to user controller
      List _fetchData = await _userController
          .loginController(userName: user['email'], password: user['password'])
          .catchError((e) => debugPrint(e.toString()));

      if (_fetchData != null) {
        if (_fetchData.isNotEmpty) {
          Navigator.pushReplacementNamed(context, TabsScreen.routeName);
        }
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: deviceSize.height * 0.1),
                  Image.asset(
                    "assets/images/padavukal.jpg",
                    scale: 3,
                  ),
                  SizedBox(height: deviceSize.height * 0.05),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              onSaved: (value) {
                                user['email'] = value;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  hintText: "Phone Number ",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: _borderRadius)),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              obscureText: _obsureText,
                              onSaved: (value) {
                                user['password'] = value;
                              },
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  suffixIcon: IconButton(
                                      icon: _obsureText
                                          ? Icon(MdiIcons.eyeOff)
                                          : Icon(MdiIcons.eye),
                                      onPressed: () {
                                        setState(() {
                                          _obsureText = !_obsureText;
                                        });
                                      }),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: _borderRadius)),
                            ),
                            SizedBox(height: deviceSize.height * 0.02),
                            BlueButton(
                                title: "Log in",
                                width: 370,
                                onPressed: () => login()),
                            // Text("Forgot password"),
                            // Text(
                            //   "Or",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold, fontSize: 12),
                            // ),
                            // SizedBox(height: deviceSize.height * 0.01),
                            // OutLinedButton(
                            //   title: "Log in with Google",
                            //   imageUrl: "assets/images/googleIcon.png",
                            //   width: deviceSize.width * 0.234,
                            // ),
                            SizedBox(height: deviceSize.height * 0.06),
                            Text("Register your account"),
                            BlueButton(
                              title: "Sign up",
                              width: 160,
                              onPressed: () {
                                Navigator.pushNamed(context, SignIn.routeName);
                              },
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
