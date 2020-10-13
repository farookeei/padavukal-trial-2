// import 'package:flutter/material.dart';
// import 'package:padavukal/styles/styles.dart';

// class RelatedVideos extends StatelessWidget {
//   final String title;
//   RelatedVideos(this.title);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       height: MediaQuery.of(context).size.height * 0.22,
//       width: double.infinity,
//       // color: Colors.blue,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 19.0),
//             child: Text(
//               title,
//               style: chapsubheading,
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (ctx, i) {
//                   // final Chapter chapters = chapDetailsMaths[i];
//                   return GestureDetector(
//                     onTap: () {},
//                     child: Stack(
//                       children: [
//                         Image.asset("assets/images/sets2.png"),
//                         // Positioned(
//                         //   left: 120,
//                         //   top: 70,
//                         //   child: Icon(
//                         //     MdiIcons.playCircle,
//                         //   ),
//                         // ),
//                         // Positioned(
//                         //   left: 20,
//                         //   top: 120,
//                         //   child: Text(
//                         //     " Mathematics : Chapter ${"chapDetailsMaths[i].number"} | Video ${"chapDetailsMaths[i].number"}",
//                         //     style: TextStyle(
//                         //       color: Colors.white,
//                         //     ),
//                         //     overflow: TextOverflow.ellipsis,
//                         //   ),
//                         // )
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//           Divider(
//             thickness: 1,
//           ),
//         ],
//       ),
//     );
//   }
// }
