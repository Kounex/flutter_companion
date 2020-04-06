import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_container/shared/custom_drawer.dart';
import 'package:the_container/types/color_type.dart';
import 'package:the_container/utils/color_helper.dart';
import 'package:the_container/views/better_showcase/widgets/color_argb/color_argb.dart';
import 'package:the_container/views/better_showcase/widgets/labeled_row.dart';
import 'package:the_container/views/better_showcase/widgets/labeled_slider.dart';
import 'package:the_container/views/better_showcase/widgets/prepared_container.dart';

class BetterShowcaseView extends StatefulWidget {
  @override
  _BetterShowcaseViewState createState() => _BetterShowcaseViewState();
}

class _BetterShowcaseViewState extends State<BetterShowcaseView> {
  double _height = 50.0;
  double _width = 50.0;

  double _radius = 0.0;

  BoxShape _shape = BoxShape.rectangle;

  List<BoxShadow> _shadow;

  ColorType _colorType = ColorType.dropdown;
  Color _colorDropdown = Colors.amber;
  TextEditingController _colorAController = TextEditingController(text: '255');
  TextEditingController _colorRController = TextEditingController(text: '0');
  TextEditingController _colorGController = TextEditingController(text: '0');
  TextEditingController _colorBController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    double maxHeight = (MediaQuery.of(context).size.height / 3).roundToDouble();
    double maxWidth = (MediaQuery.of(context).size.width -
            50 -
            MediaQuery.of(context).padding.horizontal)
        .roundToDouble();

    if (_width > maxWidth) {
      setState(() => _width = maxWidth);
    }
    if (_height > maxHeight) {
      setState(() => _height = maxHeight);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Better Showcase'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
        ),

        /// SafeArea is used for views / widgets which may use a lot
        /// if not even the full screen size - modenr smartphones have
        /// areas which may cause UI problems (like iPhone X with its notch)
        /// where UI elements may end up right behind it. SafeArea makes
        /// sure that UI is being displayed inside an 'safe area' where
        /// nothing display hardware related may cause trouble
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 25.0,
                  bottom: 25.0,
                ),
                child: PreparedContainer(
                  currentWidth: _width,
                  currentHeight: _height,
                  maxHeight: maxHeight,
                  color: _colorType == ColorType.dropdown
                      ? _colorDropdown
                      : Color.fromARGB(
                          int.parse(_colorAController.text),
                          int.parse(_colorRController.text),
                          int.parse(_colorGController.text),
                          int.parse(_colorBController.text),
                        ),
                  shape: _shape,
                  borderRadius: _radius,
                  shadow: _shadow,
                ),
              ),
              LabeledSlider(
                label: 'Height',
                currentValue: _height,
                maxValue: maxHeight,
                onChanged: (height) => setState(() => _height = height),
              ),
              LabeledSlider(
                label: 'Width',
                currentValue: _width,
                maxValue: maxWidth,
                onChanged: (width) => setState(() => _width = width),
              ),

              /// Could argue to put this non-generic Widget into
              /// its own Widgets just for readability
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ColorType.values
                    .map(
                      (colorType) => Row(
                        children: <Widget>[
                          Radio(
                            value: colorType,
                            groupValue: _colorType,
                            onChanged: (val) =>
                                setState(() => _colorType = val),
                          ),
                          Text(colorType.name),
                        ],
                      ),
                    )
                    .toList(),
              ),
              LabeledRow(
                label: 'Color',
                child: _colorType == ColorType.dropdown
                    ? DropdownButton(
                        value: _colorDropdown,
                        items: ColorHelper.availableColors.keys
                            .map(
                              (colorKey) => DropdownMenuItem(
                                child: Text(colorKey),
                                value: ColorHelper.availableColors[colorKey],
                              ),
                            )
                            .toList(),
                        onChanged: (color) =>
                            setState(() => _colorDropdown = color),
                      )
                    : ColorARGB(
                        colorAController: _colorAController,
                        colorRController: _colorRController,
                        colorGController: _colorGController,
                        colorBController: _colorBController,
                        onChanged: (_) => setState(() {}),
                      ),
              ),
              LabeledRow(
                label: 'Border',
                child: DropdownButton<int>(
                  value: _radius.toInt(),
                  disabledHint: Text('${_radius.round()} px'),
                  items: List<DropdownMenuItem<int>>.generate(
                    11,
                    (index) => DropdownMenuItem(
                      child: Text('${index * 5} px'),
                      value: index * 5,
                    ),
                  ),
                  onChanged: _shape == BoxShape.rectangle
                      ? (radius) => setState(() => _radius = radius.toDouble())
                      : null,
                ),
              ),
              LabeledRow(
                label: 'Shape',
                child: DropdownButton<BoxShape>(
                  value: _shape,
                  items: BoxShape.values
                      .map(
                        (shape) => DropdownMenuItem(
                          child: Text(shape.toString().split('.')[1]),
                          value: shape,
                        ),
                      )
                      .toList(),
                  onChanged: (shape) => setState(() => _shape = shape),
                ),
              ),
              LabeledRow(
                label: 'Shaodw',
                child: DropdownButton<List<BoxShadow>>(
                  value: _shadow,
                  items: [0]
                      .followedBy(kElevationToShadow.keys)
                      .map(
                        (shadowKey) => DropdownMenuItem(
                          child: Text(
                            shadowKey.toString(),
                          ),
                          value: kElevationToShadow[shadowKey],
                        ),
                      )
                      .toList(),
                  onChanged: (shadow) => setState(() => _shadow = shadow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
