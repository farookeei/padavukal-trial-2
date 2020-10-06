import 'package:flutter/material.dart';
import 'package:padavukal/widgets/buttons/outline_button.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    @required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        width: deviceSize.width,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Which metal has the highest resistivity",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20),
            OutLinedButton(
              imageUrl: "assets/images/a.png",
              title: "Silver",
              width: 6,
            ),
            OutLinedButton(
              imageUrl: "assets/images/b.png",
              title: "Copper",
              width: 6,
            ),
            OutLinedButton(
              imageUrl: "assets/images/c.png",
              title: "Aluminium",
              width: 6,
            ),
            OutLinedButton(
              imageUrl: "assets/images/d.png",
              title: "Iron",
              width: 6,
            ),
          ],
        ),
      ),
    );
  }
}
