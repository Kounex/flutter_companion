import 'package:flutter/material.dart';
import 'package:the_container/views/better_showcase/widgets/color_argb/color_textfield.dart';

class ColorARGB extends StatelessWidget {
  final TextEditingController colorAController;
  final TextEditingController colorRController;
  final TextEditingController colorGController;
  final TextEditingController colorBController;
  final ValueChanged<String> onChanged;

  ColorARGB(
      {@required this.colorAController,
      @required this.colorRController,
      @required this.colorGController,
      @required this.colorBController,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: ColorTextfield(
              colorController: this.colorAController,
              label: 'A',
              onChanged: this.onChanged),
        ),
        Container(width: 25.0),
        Flexible(
          child: ColorTextfield(
              colorController: this.colorRController,
              label: 'R',
              onChanged: this.onChanged),
        ),
        Container(width: 25.0),
        Flexible(
          child: ColorTextfield(
              colorController: this.colorGController,
              label: 'G',
              onChanged: this.onChanged),
        ),
        Container(width: 25.0),
        Flexible(
          child: ColorTextfield(
              colorController: this.colorBController,
              label: 'B',
              onChanged: this.onChanged),
        ),
      ],
    );
  }
}
