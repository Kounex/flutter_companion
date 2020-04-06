import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorTextfield extends StatelessWidget {
  final double width;
  final TextEditingController colorController;
  final String label;
  final ValueChanged<String> onChanged;

  ColorTextfield(
      {this.width = 75.0,
      @required this.colorController,
      @required this.label,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: this.width),
      child: TextField(
        controller: this.colorController,
        maxLength: 3,
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction((oldValue, newValue) {
            if (int.parse(newValue.text) > 255) {
              this.colorController.text = oldValue.text;
              return oldValue;
            }
            return newValue;
          })
        ],
        decoration: InputDecoration(
          counterText: this.label,
        ),
        onChanged: this.onChanged,
      ),
    );
  }
}
