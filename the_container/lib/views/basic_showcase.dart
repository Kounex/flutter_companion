import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Map<String, Color> availableColors = {
  'Amber': Colors.amber,
  'Black': Colors.black,
  'Blue': Color.fromRGBO(5, 22, 77, 1.0),
  'Light Blue': Colors.blue,
  'Brown': Colors.brown,
  'Green': Colors.green,
  'Grey': Colors.grey,
  'Indigo': Colors.indigo,
  'Orange': Colors.orange,
  'Pink': Colors.pink,
  'Red': Colors.red,
  'White': Colors.white
};

class BasicShowcaseView extends StatefulWidget {
  @override
  _BasicShowcaseViewState createState() => _BasicShowcaseViewState();
}

class _BasicShowcaseViewState extends State<BasicShowcaseView> {
  double _height = 50.0;
  double _width = 50.0;

  Color _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    double maxSize = (MediaQuery.of(context).size.width - 50).roundToDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Showcase'),
      ),
      body: ListView(
        children: <Widget>[
          /// Using Align because the Container is inside
          /// a ListView and will therefore be "stretched"
          /// horizontally on default - Align does counter
          /// this behaviour
          Padding(
            padding: EdgeInsets.only(
              top: 50.0,
              bottom: 50.0,
            ),
            child: SizedBox(
              height: maxSize,
              child: Align(
                child: Container(
                  height: _height,
                  width: _width,
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Text('Height:'),
                ),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: maxSize,
                    value: _height,
                    label: '${_height.round()}',
                    divisions: maxSize.toInt(),
                    onChanged: (height) => setState(() => _height = height),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Text('Width:'),
                ),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: maxSize,
                    value: _width,
                    label: '${_width.round()}',
                    divisions: maxSize.toInt(),
                    onChanged: (width) => setState(() => _width = width),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Text('Color:'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: DropdownButton(
                    value: _color,
                    items: availableColors.keys
                        .map(
                          (colorKey) => DropdownMenuItem(
                            child: Text(colorKey),
                            value: availableColors[colorKey],
                          ),
                        )
                        .toList(),
                    onChanged: (color) => setState(() => _color = color),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
