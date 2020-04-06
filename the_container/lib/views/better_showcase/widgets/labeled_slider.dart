import 'package:flutter/material.dart';

class LabeledSlider extends StatelessWidget {
  final String label;
  final double currentValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onChanged;

  LabeledSlider(
      {this.label,
      this.minValue = 0.0,
      @required this.maxValue,
      @required this.currentValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (this.label != null)
          Container(
            width: 60.0,
            child: Text('${this.label}:'),
          ),
        Expanded(
          child: Slider(
            min: this.minValue,
            max: this.maxValue,
            value: this.currentValue,
            label: '${this.currentValue.round()}',
            divisions: this.maxValue.toInt(),
            onChanged: this.onChanged,
          ),
        ),
        Container(
          width: 50.0,
          child: Text('${this.currentValue.round()} px'),
        ),
      ],
    );
  }
}
