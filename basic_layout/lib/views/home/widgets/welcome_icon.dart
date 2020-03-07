import 'dart:ui';

import 'package:flutter/material.dart';

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
