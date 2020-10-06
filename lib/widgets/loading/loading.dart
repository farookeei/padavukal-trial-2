import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String title;
  LoadingWidget({this.title = ''});
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 5,
      child: Column(
        children: [
          CircularProgressIndicator(),
          const SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
