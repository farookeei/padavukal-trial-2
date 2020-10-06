import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final IconData icon;
  final String text;

  Buttons({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[50],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: FlatButton.icon(
            onPressed: () {}, icon: Icon(icon), label: Text(text)));
  }
}
