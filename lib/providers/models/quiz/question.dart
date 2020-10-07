import 'package:padavukal/providers/models/quiz/choices.dart';

class Question {
  final String question;
  final Choices choices;
  final String answer;

  Question({
    this.question,
    this.choices,
    this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['questions'] ?? '',
      answer: json['choices'][0][json['answer'][0]['Answer']] ?? '',
      choices: Choices.fromJson(json['choices'][0]) ?? Choices(),
    );
  }
}
