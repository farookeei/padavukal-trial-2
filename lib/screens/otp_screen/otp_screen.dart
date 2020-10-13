// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:padavukal/screens/course_screen/courses_screen.dart';

// import 'package:padavukal/styles/styles.dart';
// import 'package:padavukal/widgets/buttons/BlueButton.dart';

// class OtpScreen extends StatelessWidget {
//   static const routeName = "/otp-screen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Verification Code",
//                   style: Theme.of(context).textTheme.headline5,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Enter the OTP sent to the mobile number",
//                   style: blackappbartext,
//                 ),
//                 SizedBox(height: 20),
//                 OTPTextField(
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 50,
//                   style: TextStyle(fontSize: 17),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.underline,
//                   onCompleted: (pin) {
//                     print("Completed: " + pin);
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 BlueButton(
//                   title: "Verify",
//                   width: 200,
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(
//                         context, CourseScreen.routeName);
//                   },
//                 ),
//                 Text("If you didn't receive a code! Resend"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
