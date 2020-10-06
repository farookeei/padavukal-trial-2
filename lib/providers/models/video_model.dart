class VideoModel {
  int id;
  String name;
  String description;
  String image;
  String notes;
  String url;
  int chapters;

  VideoModel({
    this.chapters,
    this.description,
    this.id,
    this.image,
    this.name,
    this.url,
    this.notes,
  });

  // VideoModel fromJson(data) {
  //   return VideoModel(
  //     id: data['id'],
  //     name: data['name'],
  //     description: data["description"],
  //     image: data["image"],
  //     notes: data["notes"],
  //     chapters: data["chapters"],
  //   );
}
