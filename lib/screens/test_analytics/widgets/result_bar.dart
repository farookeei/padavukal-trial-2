import 'package:flutter/material.dart';
import 'package:padavukal/styles/styles.dart';

class ResultBar extends StatelessWidget {
  final Color color;
  final int count;
  final String text;

  ResultBar({this.color, this.count, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            "$count",
            style: TextStyle(color: color),
          ),
        ),
        title: Text(
          text,
          style: testdesc2,
        ),
      ),
    );
  }
}
