import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'widgets/description.dart';
import 'widgets/related_videos.dart';

class ChapDetails extends StatefulWidget {
  static const routeName = "/sub-details";

  final String videoUrl;

  const ChapDetails({
    Key key,
    @required this.videoUrl,
  }) : super(key: key);

  @override
  _ChapDetailsState createState() => _ChapDetailsState();
}

class _ChapDetailsState extends State<ChapDetails> {
  // String videoURL = "https://youtu.be/80pRyn7fZRk";

  YoutubePlayerController _controller;

  @override
  void initState() {
    print(widget.videoUrl);
    _controller = YoutubePlayerController(
      flags: YoutubePlayerFlags(
        autoPlay: true,
        controlsVisibleAtStart: true,
      ),
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // User currentUser =
    //     Provider.of<UserProvider>(context, listen: false).currentUser;

    //  String url = Provider.of<CourseProvider>(context, listen: false)
    //       .chapterData[0]
    //       .videos[0]
    //       .url;

    return Scaffold(
      appBar: AppBar(
        leading: PopupButton(),
        title: Text(
          "Videos",
          style: blackappbartext,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(
            //   "assets/images/bio.png",
            //   scale: 0.1,
            // ),
            Container(
              height: 250,
              width: double.infinity,
              child: YoutubePlayer(
                bottomActions: [
                  CurrentPosition(),
                ],
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            Description(),
            RelatedVideos("Related Videos"),
            RelatedVideos("Chapters 2 - Units and Measurement"),
          ],
        ),
      ),
    );
  }
}
