import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/models/video_model.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

import '../../styles/styles.dart';
import '../../widgets/buttons/popbutton.dart';
import 'widgets/description.dart';
import 'widgets/related_videos.dart';

class ChapDetails extends StatefulWidget {
  static const routeName = "/sub-details";

  final VideoModel videoDetails;

  const ChapDetails({
    Key key,
    @required this.videoDetails,
  }) : super(key: key);

  @override
  _ChapDetailsState createState() => _ChapDetailsState();
}

class _ChapDetailsState extends State<ChapDetails> {
  @override
  Widget build(BuildContext context) {
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
            ListView(
              shrinkWrap: true,
              children: [
                VimeoPlayer(
                  id: widget.videoDetails.url,
                  looping: false,
                  autoPlay: true,
                ),
              ],
            ),
            Description(
              videoDetials: widget.videoDetails,
            ),
            RelatedVideos("Related Videos"),
            RelatedVideos("Chapters 2 - Units and Measurement"),
          ],
        ),
      ),
    );
  }
}
