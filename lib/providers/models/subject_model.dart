import 'package:flutter/material.dart';

class SubjectModel {
  int id;
  String name;
  int services;
  // List<Color> colors;
  // List<String> imageUrl;

  SubjectModel({
    this.id,
    this.name,
    this.services,
    // this.colors,
    // this.imageUrl,
  });

  SubjectModel fromJson(data) {
    return SubjectModel(
      id: data['id'],
      name: data['name'],
      services: data["services"],
    );
  }
}

class SubjectStatic {
  String imageUrl;
  Color color;
  SubjectStatic({
    this.color,
    this.imageUrl,
  });
}

final List<SubjectStatic> subjects = [
  SubjectStatic(
    color: Color.fromRGBO(87, 113, 251, 100),
    imageUrl: "assets/images/maths.png",
  ),
  SubjectStatic(
    color: Color.fromRGBO(243, 163, 42, 100),
    imageUrl: "assets/images/phy.png",
  ),
  SubjectStatic(
    color: Color.fromRGBO(71, 182, 53, 100),
    imageUrl: "assets/images/chem.png",
  ),
  SubjectStatic(
    color: Color.fromRGBO(249, 92, 92, 100),
    imageUrl: "assets/images/bio.png",
  ),
];

// List _colors = [
//   Color.fromRGBO(87, 113, 251, 100),
//   Color.fromRGBO(243, 163, 42, 100),
//   Color.fromRGBO(71, 182, 53, 100),
//   Color.fromRGBO(249, 92, 92, 100),
//   Color.fromRGBO(87, 113, 251, 100),
// ];
// List _images = [
//   "assets/images/maths.png",
//   "assets/images/phy.png",
//   "assets/images/chem.png",
//   "assets/images/bio.png",
// ];

// import 'package:flutter/material.dart';
// import 'package:padavukal/models/chapter_model.dart';

// class Subject {
//   int id;
//   String title;
//   Color color;
//   int totalChapters;
//   int totalVideos;
//   String imageUrl;
//   List<Chapter> chapDetails;

//   Subject({
//     this.id,
//     this.title,
//     this.color,
//     this.totalChapters,
//     this.totalVideos,
//     this.imageUrl,
//     this.chapDetails,
//   });
// }

// final List<Subject> subjects = [
//   Subject(
//     id: 1,
//     title: "Physics",
//     color: Color.fromRGBO(87, 113, 251, 100),
//     totalChapters: 12,
//     totalVideos: 108,
//     imageUrl: "assets/images/phy.png",
//     chapDetails: chapDetailsPhy,
//   ),
//   Subject(
//     id: 2,
//     title: "Chemistry",
//     color: Color.fromRGBO(243, 163, 42, 100),
//     totalChapters: 12,
//     totalVideos: 108,
//     imageUrl: "assets/images/chem.png",
//     chapDetails: chapDetailsChem,
//   ),
//   Subject(
//     id: 3,
//     title: "Biology",
//     color: Color.fromRGBO(71, 182, 53, 100),
//     totalChapters: 12,
//     totalVideos: 108,
//     imageUrl: "assets/images/bio.png",
//     chapDetails: chapDetailsBio,
//   ),
//   Subject(
//     id: 4,
//     title: "Mathematics",
//     color: Color.fromRGBO(249, 92, 92, 100),
//     totalChapters: 12,
//     totalVideos: 108,
//     imageUrl: "assets/images/maths.png",
//     chapDetails: chapDetailsMaths,
//   ),
//   /////
// ];
// ///////////////////////////////////////////////
// final List<Chapter> chapDetailsMaths = [
//   Chapter(
//       name: "Set",
//       number: 1,
//       videoCount: 20,
//       imageUrl: ["assets/images/sets1.png", "assets/images/sets2.png"],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Relations and Functions",
//       number: 2,
//       videoCount: 20,
//       imageUrl: ["assets/images/sets1.png", "assets/images/sets2.png"],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Trignometric Functions",
//       number: 3,
//       videoCount: 20,
//       imageUrl: ["assets/images/sets1.png", "assets/images/sets2.png"],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
// ];
// ///////////
// List<Chapter> chapDetailsPhy = [
//   Chapter(
//     name: "Physical World",
//     number: 1,
//     videoCount: 20,
//     imageUrl: ["", ""],
//     description:
//         "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant.",
//   ),
//   Chapter(
//       name: "Units and Measurements",
//       number: 2,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Motion in a Straight Line",
//       number: 3,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
// ];
// ///////////
// List<Chapter> chapDetailsChem = [
//   Chapter(
//       name: "Some Basic Concepts of Chemistry",
//       number: 1,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Structure of The Atom",
//       number: 2,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "States of Matter",
//       number: 3,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
// ];
// //////////
// List<Chapter> chapDetailsBio = [
//   Chapter(
//       name: "Living World",
//       number: 1,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Biological Classification",
//       number: 2,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
//   Chapter(
//       name: "Plant Kingdom",
//       number: 3,
//       videoCount: 20,
//       imageUrl: ["", ""],
//       description:
//           "If a body travels in a straight line and covers an equal amount of distance in an equal interval of time. In simple words, a body is said to have uniform acceleration if the rate of change of its velocity remains constant."),
// ];
