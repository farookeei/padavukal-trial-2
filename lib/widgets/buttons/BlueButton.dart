import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final double width;
  final Function onPressed;

  BlueButton({this.title, this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        // padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        onPressed: onPressed,
        color: Colors.blue,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }
}
