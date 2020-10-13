import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  "Blogs",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 15),
                BlogContent(
                  image: "assets/images/blog1.webp",
                  content:
                      "Set aside time for independent reading. Time for reading independently doesn’t just happen. Plan for it by making it a priority in schedules across classrooms. You may need to get creative by stealing minutes here and there, but find at least 15 minutes a day (20 recommended) for self-selecting, independent reading",
                ),
                BlogContent(
                  image: "assets/images/blog2.jpg",
                  content:
                      "A literacy-rich environment – full of print, word walls, books, and reading materials –  not only supports the academic growth, but also provides a setting that encourages and supports speaking, listening, reading, and writing in a variety of authentic ways – through print & digital media. Make it a priority for every classroom to be an inviting, print-rich environment that supports independent reading and student learning",
                ),
                BlogContent(
                  image: "assets/images/onboard2.png",
                  content:
                      " Students need access to interesting books and materials – both in print and online. When students are provided with well-designed classroom libraries, they interact more with books, spend more time reading, exhibit more positive attitudes toward reading, and exhibit higher levels of reading achievement . Additionally, research-based classroom libraries support balanced literacy instruction. Support teachers in building classroom libraries through budget dollars, grants, and book drives.",
                ),
                BlogContent(
                  image: "assets/images/onboard3.png",
                  content:
                      "“The single most important activity for building the knowledge required for eventual success in reading is reading aloud to children.” Not only did the experts suggest reading aloud in the home, but they also suggested reading aloud in schools. Read alouds not only allow teachers to model that reading is a great way to spend time but also expose students to more complex vocabulary than they typically hear or read. ",
                ),
              ],
            ),
          ),
        ],
        scrollDirection: Axis.vertical,
      )),
    );
  }
}

class BlogContent extends StatelessWidget {
  final String image;
  final String content;

  BlogContent({this.content, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            image,
            scale: 2,
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
