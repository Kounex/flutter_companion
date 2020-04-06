import 'package:flutter/material.dart';

class LabeledRow extends StatelessWidget {
  final double labelWidth;
  final String label;
  final Widget child;

  LabeledRow({this.labelWidth = 60.0, @required this.label, this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: this.labelWidth,
          child: Text('${this.label}:'),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: this.child,
          ),
        )
      ],
    );
  }
}
