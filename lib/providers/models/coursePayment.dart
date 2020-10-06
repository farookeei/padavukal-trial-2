import 'package:flutter/cupertino.dart';

class CoursePaymentModel {
  final int id;
  final String name;
  final String amount;
  final int duration;
  final int servicesID;

  CoursePaymentModel({
    @required this.amount,
    @required this.duration,
    @required this.id,
    @required this.name,
    @required this.servicesID,
  });
}
