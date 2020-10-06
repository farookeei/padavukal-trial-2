import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  GradientButton({this.color, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(0.0),
        child: Container(
          padding: const EdgeInsets.all(13),
          width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(44, 107, 203, 44),
                  Color.fromRGBO(44, 107, 203, 100),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: color),
          ),
        ));
  }
}
