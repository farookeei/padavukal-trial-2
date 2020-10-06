import 'package:flutter/material.dart';

class RecentlyViewed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Viewed",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx, i) {
                  return Stack(
                    children: [
                      Image.asset("assets/images/sets1.png"),
                      // Positioned(
                      //   left: MediaQuery.of(context).size.width * 0.23,
                      //   top: MediaQuery.of(context).size.width * 0.14,
                      //   child: Icon(
                      //     MdiIcons.playCircle,
                      //   ),
                      // ),
                      Positioned(
                        left: 20,
                        top: 120,
                        child: Text(
                          " Mathematics : Chapter 1 | Video 2",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
