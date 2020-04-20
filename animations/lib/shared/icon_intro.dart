import 'dart:ui';

import 'package:flutter/material.dart';

/// This is a widget specifically used in the home (view) widget. If this widget should
/// be used in other places in the app as well - make it more generic: allow properties
/// like the actual icon, maybe padding, color whatever to change it according to needs
/// and put the widget to shared.
class IconIntro extends StatelessWidget {
  final String title;
  final IconData icon;

  IconIntro({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(42.0),
      child: Column(
        children: <Widget>[
          Icon(
            this.icon,
            size: 72.0,
          ),
          Text(
            this.title,
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
