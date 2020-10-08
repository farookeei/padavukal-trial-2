import 'package:flutter/material.dart';

class OutLinedButton extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double width;
  final bool isSelected;

  OutLinedButton({this.title, this.imageUrl, this.width, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.blue[50] : Colors.white,
      width: MediaQuery.of(context).size.width * 0.85,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        // padding: EdgeInsets.all(10),
        onPressed: null,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.asset(
                imageUrl,
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        borderSide: BorderSide(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 0.8,
        ),
      ),
    );
  }
}
