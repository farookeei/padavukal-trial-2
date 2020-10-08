import 'package:flutter/material.dart';
import 'package:padavukal/providers/models/quiz/choices.dart';
import 'package:padavukal/providers/models/quiz/question.dart';
import 'package:padavukal/widgets/buttons/outline_button.dart';

class QuestionCard extends StatefulWidget {
  final Question question;

  const QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int index = -1;

  @override
  void initState() {
    Question question = widget.question;
    Choices choices = question.choices;

    if (question.selectedAnswer == choices.choiceA) {
      index = 1;
    } else if (question.selectedAnswer == choices.choiceB) {
      index = 2;
    } else if (question.selectedAnswer == choices.choiceC) {
      index = 3;
    } else if (question.selectedAnswer == choices.choiceD) {
      index = 4;
    } else {
      index = -1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
              widget.question.question,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                widget.question.selectedAnswer =
                    widget.question.choices.choiceA;
                setState(() {
                  index = 1;
                });
                print(index);
              },
              child: OutLinedButton(
                imageUrl: "assets/images/a.png",
                title: widget.question.choices.choiceA,
                isSelected: index == 1,
                width: 6,
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.question.selectedAnswer =
                    widget.question.choices.choiceA;
                setState(() {
                  index = 2;
                });
              },
              child: OutLinedButton(
                imageUrl: "assets/images/b.png",
                title: widget.question.choices.choiceB,
                isSelected: index == 2,
                width: 6,
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.question.selectedAnswer =
                    widget.question.choices.choiceA;
                setState(() {
                  index = 3;
                });
              },
              child: OutLinedButton(
                imageUrl: "assets/images/c.png",
                title: widget.question.choices.choiceC,
                isSelected: index == 3,
                width: 6,
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.question.selectedAnswer =
                    widget.question.choices.choiceD;
                setState(() {
                  index = 4;
                });
              },
              child: OutLinedButton(
                imageUrl: "assets/images/d.png",
                title: widget.question.choices.choiceD,
                isSelected: index == 4,
                width: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
