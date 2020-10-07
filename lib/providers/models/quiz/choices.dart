class Choices {
  final String choiceA;
  final String choiceB;
  final String choiceC;
  final String choiceD;

  Choices({
    this.choiceA,
    this.choiceB,
    this.choiceC,
    this.choiceD,
  });

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      choiceA: json['choice1'] ?? '',
      choiceB: json['choice2'] ?? '',
      choiceC: json['choice3'] ?? '',
      choiceD: json['choice4'] ?? '',
    );
  }
}
