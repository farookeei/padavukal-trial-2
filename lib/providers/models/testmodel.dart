class TestModel {
  int id;
  String test;
  int chapters;

  TestModel({
    this.chapters,
    this.id,
    this.test,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      chapters: json['chapters'],
      id: json['id'],
      test: json['test'],
    );
  }
}
