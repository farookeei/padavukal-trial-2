import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/buttons/BlueButton.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 25, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlueButton(
                    title: "Physics",
                    width: deviceSize.width * 0.25,
                    onPressed: () {},
                  ),
                  SizedBox(width: 9),
                  Container(
                    width: deviceSize.width * 0.3,
                    child: Text(
                      "Chapter 1 | Video 1",
                      overflow: TextOverflow.ellipsis,
                      style: chapsubheading,
                    ),
                  ),
                ],
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.noteText,
                  color: Theme.of(context).accentColor,
                ),
                label: Text(
                  "Notes",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            "Motion in a Straight Line",
            style: chapheading,
          ),
          SizedBox(height: 6),
          // Text("chapDetailsMaths[0].description"),
          SizedBox(height: 7),
          // VideoList(subject: subject),
        ],
      ),
    );
  }
}
