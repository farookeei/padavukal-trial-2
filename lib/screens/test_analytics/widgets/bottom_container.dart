import 'package:flutter/material.dart';
import 'package:padavukal/styles/styles.dart';

class BottomContainer extends StatelessWidget {
  final String text1, text2;
  final IconData icon;

  BottomContainer({this.text1, this.text2, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          text1,
          style: blackappbartext,
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.04),
        Text(
          text2,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
