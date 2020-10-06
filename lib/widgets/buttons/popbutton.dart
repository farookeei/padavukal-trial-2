import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PopupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          MdiIcons.keyboardBackspace,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
