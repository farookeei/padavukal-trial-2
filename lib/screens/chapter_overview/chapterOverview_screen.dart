import 'package:flutter/material.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/chapter_model.dart';
import 'package:padavukal/providers/models/subject_model.dart';
import 'package:padavukal/providers/models/user_model.dart.dart';
import 'package:padavukal/providers/models/video_model.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/chapDetails/chapDetails.dart';
import 'package:padavukal/services/basicConfig.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class ChapterOverView extends StatelessWidget {
  static const routeName = "/subject-overview";

  final SubjectStatic subjectsto;
  final SubjectModel data;
  ChapterOverView({this.subjectsto, this.data});
  //* receiving from homeScreen

  @override
  Widget build(BuildContext context) {
    User currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;

    Provider.of<CourseProvider>(context, listen: false)
        .chapterRetrieve(userToken: currentUser.token, id: data.id);

    // final ddddata = Provider.of<Course>(context, listen: false)
    //     .chapterData; //* for getting  chapid for retrieving video

    // Provider.of<Course>(context, listen: false).videoRetrieve(
    //     userToken: currentUser.token, id: int.parse(ddddata[0].id));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: subjectsto.color,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 130,
                color: subjectsto.color, //* have to make dynamic
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.name, //*  dynamic
                            style: whiteheading,
                          ),
                          Text(
                              // "${subject.totalChapters} Chapters | ${subject.totalVideos} videos",
                              " Chapters |  videos",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ),
                    ),

                    ///
                    Image.asset(
                      subjectsto.imageUrl,
                      scale: 2,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Chapters",
                  style: chapheading, //STYLES.DART
                ),
              ),
              Consumer<CourseProvider>(builder: (ctx, chapData, _) {
                return chapData.isLoading
                    ? LoadingWidget(
                        title: "Loading Chapters",
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height / 0.75,
                        child: ListView.builder(
                            itemCount: chapData.chapterData.length,
                            itemBuilder: (ctx, index) {
                              return ChapterWidget(
                                  chapterData: chapData.chapterData[index]);
                            }),
                      );
              })
            ],
          ),
        ),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({
    Key key,
    @required this.chapterData,
  }) : super(key: key);

  final ChapterModel chapterData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 240,
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  chapterData.name, //* dynamic
                  overflow: TextOverflow.ellipsis,
                  style: chapsubheading,
                ),
              ),
              // Text("${subject.chapDetails[0].videoCount} videos")
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: subject.chapDetails.length,
              itemCount: chapterData.videos.length,
              //! have to make dynamic
              itemBuilder: (ctx, i) {
                final VideoModel videos = chapterData.videos[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChapDetails(
                          videoUrl: videos.url,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Image.network(
                        "$baseURL ${chapterData.videos[i].image}",
                        fit: BoxFit.cover,
                      )),
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
