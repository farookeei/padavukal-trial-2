class QuestionModel {
  String id;
  List<Choices> choices;
  List<Answer> answer;
  String questions;
  int test;

  QuestionModel({
    this.choices,
    this.id,
    this.answer,
    this.questions,
    this.test,
  });
}

class Choices {
  int id;
  String choice1;
  String choice2;
  String choice3;
  String choice4;
  int questions;

  Choices({
    this.choice1,
    this.choice2,
    this.choice3,
    this.choice4,
    this.id,
    this.questions,
  });
}

class Answer {
  int id;
  String answer;
  int questions;

  Answer({
    this.answer,
    this.id,
    this.questions,
  });
}
