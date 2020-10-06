import 'package:flutter/material.dart';

class BlueBorderButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  BlueBorderButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(13),
        borderSide: BorderSide(color: Colors.blue),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
