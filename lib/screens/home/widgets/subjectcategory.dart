// import 'package:flutter/material.dart';
// import 'package:padavukal/models/subject_model.dart';
// import 'package:padavukal/screens/subject_overview/subjectoverview_screen.dart';
// import 'package:padavukal/styles/styles.dart';

// class SubCategoryItems extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       // onTap: () => Navigator.pushNamed(context, SubjectOverView.routeName,arguments: subject),
//       // onTap: () => Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (_) => SubjectOverView(
//       //               subject: subject,
//       //             ))),
//       onTap: () => print("subcategory pressed "),
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(5),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Flexible(
//                 flex: 3,
//                 child: Text(
//                   subject.title,
//                   style: whiteheading2,
//                 ),
//               ),
//               Flexible(
//                 flex: 2,
//                 child: Image.asset(
//                   subject.imageUrl, fit: BoxFit.contain,
//                   // scale: 7,
//                 ),
//               ),
//             ]),
//         decoration: BoxDecoration(

//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }
// }
