import 'dart:ui';

import 'package:flutter/material.dart';

/// This is a widget specifically used in the home (view) widget. If this widget should
/// be used in other places in the app as well - make it more generic like allow properties
/// like the actual icon, maybe padding, color whatever to change it according to needs
/// and put the widget to shared.
class WelcomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(42.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.layers,
            size: 72.0,
          ),
          Text(
            'Basic Layout',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
              fontSize: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
