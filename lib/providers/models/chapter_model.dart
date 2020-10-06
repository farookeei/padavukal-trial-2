import 'video_model.dart';

class ChapterModel {
  int id;
  String name;
  List<VideoModel> videos;
  int subject; //* it is according to this the corresponding chapter is loaded

  ChapterModel({
    this.subject,
    this.id,
    this.name,
    this.videos,
  });

  ChapterModel fromJson(data) {
    return ChapterModel(
      id: data['id'],
      name: data['name'],
      subject: data["subject"],
      videos: data['videos']
          .map<VideoModel>((e) => VideoModel(
              id: e['id'],
              name: e['name'],
              description: e["description"],
              image: e["image"],
              notes: e["notes"],
              url: e["url"],
              chapters: e["chapters"]))
          .toList(),
    );
  }
}
