import 'package:flutter/material.dart';

void errorMessage({
  @required GlobalKey<ScaffoldState> scaffold,
  @required String message,
}) {
  scaffold.currentState.showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)));
}
