import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/controller/userController/userContoller.dart';
import 'package:padavukal/screens/auth/login_screen.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';
import 'package:padavukal/widgets/buttons/outline_button.dart';

class SignIn extends StatefulWidget {
  static const routeName = "/signin";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Map user = {
    "name": '',
    "phone": '',
    'email': '',
    'password': '',
  };
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ** Important
  final _passwordController = TextEditingController();

  void signup() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);

      _formKey.currentState.save();
      UserController _userController = new UserController(
        context: context,
        scaffoldKey: _scaffoldKey,
      );
      // * connection to user controller
      List _fetchData = await _userController
          .signupController(
            userName: user['phone'],
            password: user['password'],
            name: user['name'],
            email: user['email'],
          )
          .catchError((e) => debugPrint(e.toString()));

      if (_fetchData != null) {
        if (_fetchData.isNotEmpty) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      }

      setState(() => _isLoading = false);
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _obsureText1 = true;
  bool _obsureText2 = true;
  final Color _fillColor = Colors.grey[250];
  final BorderRadius _borderRadius = BorderRadius.all(Radius.circular(5));

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Registration",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 30),
                        //////////
                        TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty || value.trim().length < 5) {
                              return "Name must have minimum 5 characters";
                            }
                          },
                          onSaved: (value) {
                            user['name'] = value;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: _fillColor,
                              hintText: "Name",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: _borderRadius)),
                        ),
                        SizedBox(height: 10),
                        ////////////
                        TextFormField(
                          keyboardType: TextInputType.text,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.length < 10 ||
                                value.trim().isEmpty ||
                                value.contains(",") ||
                                value.contains(".") ||
                                value.contains("-")) {
                              return "Please enter a valid number";
                            }
                          },
                          onSaved: (value) {
                            user['phone'] = value;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: _fillColor,
                              hintText: "Phone number",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: _borderRadius)),
                        ),
                        SizedBox(height: 10),
                        //////////
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.trim().isEmpty ||
                                !value.contains('@') ||
                                !value.contains(".com")) {
                              return 'Invalid email!';
                            }
                          },
                          onSaved: (value) {
                            user['email'] = value;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: _fillColor,
                              hintText: "Email Address",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: _borderRadius)),
                        ),
                        SizedBox(height: 10),
                        /////////
                        TextFormField(
                          obscureText: _obsureText1,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.trim().isEmpty || value.length < 5) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (value) {
                            user['password'] = value;
                          },
                          controller: _passwordController, //controller
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: _obsureText1
                                      ? Icon(MdiIcons.eyeOff)
                                      : Icon(MdiIcons.eye),
                                  onPressed: () {
                                    setState(() {
                                      _obsureText1 = !_obsureText1;
                                    });
                                  }),
                              filled: true,
                              fillColor: _fillColor,
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: _borderRadius)),
                        ),
                        SizedBox(height: 10),
                        /////////
                        TextFormField(
                          obscureText: _obsureText2,
                          // ignore: missing_return
                          validator: (value) {
                            if (value != _passwordController.text ||
                                value.trim().isEmpty) {
                              return "Passwords do not match";
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: _obsureText2
                                      ? Icon(MdiIcons.eyeOff)
                                      : Icon(MdiIcons.eye),
                                  onPressed: () {
                                    setState(() {
                                      _obsureText2 = !_obsureText2;
                                    });
                                  }),
                              filled: true,
                              fillColor: _fillColor,
                              hintText: "Confirm password",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: _borderRadius)),
                        ),
                        SizedBox(height: 10),
                        BlueButton(
                          title: "Sign Up",
                          width: 370,
                          onPressed: signup,
                        ),
                        Text("Or"),
                        SizedBox(height: 10),
                        OutLinedButton(
                          title: "Sign in with Google",
                          imageUrl: "assets/images/googleIcon.png",
                          width: deviceSize.width * 0.234,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
