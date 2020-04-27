import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_container/utils/color_helper.dart';
import 'package:the_container/utils/routing_helper.dart';

/// This is a 'basic' version / example of some basic properties of
/// the container widgets. It is basic, since it is all in one view,
/// not seperated, basic form. This should show, how even simple
/// UI stuff can get redundant and clumsy - it gets really hard
/// to understand what happens where. Comments may help (as i tried)
/// to do here - but in the end: everything is a widget! If stuff
/// gets full and redundant, make your own widget! See BetterShowcase
/// for the same view but with custom widgets
class BasicShowcaseView extends StatefulWidget {
  @override
  _BasicShowcaseViewState createState() => _BasicShowcaseViewState();
}

class _BasicShowcaseViewState extends State<BasicShowcaseView> {
  double _height = 50.0;
  double _width = 50.0;

  double _radius = 0.0;

  BoxShape _shape = BoxShape.rectangle;

  List<BoxShadow> _shadow;

  /// _colorType is being used to determine if the color of the container
  /// is being set from the value which is set in the dropdown box or the
  /// ARGB values. Doing this with a String is not optimal, since another
  /// developer or even yourself might forget which types are possible and
  /// how to write them correctly. An enum is the way to go here - see
  /// BetterShowcase for that!
  String _colorType = 'Dropdown';
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

    /// Device rotation (in this case landscape to portrait) can cause errors
    /// if the container width is set to a higher value than the max width
    /// in portrait mode and a user switches back to portrait, it will result in
    /// errors - a device rotation results in a rebuild so we can check this
    /// case and set the value to a legit one!
    if (_width > maxWidth) {
      setState(() => _width = maxWidth);
    }
    if (_height > maxHeight) {
      setState(() => _height = maxHeight);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Showcase'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('The Container'),
              accountEmail: Text('Flutter Companion'),
              otherAccountsPictures: <Widget>[Icon(Icons.border_all)],
            ),
            ListTile(
              title: Text('Basic Showcase'),
              selected:
                  RoutingHelper.currentRoute == RoutingHelper.basicShowcase,
              onTap: () => RoutingHelper.drawerNavigation(
                  context, RoutingHelper.basicShowcase),
            ),
            Divider(),
            ListTile(
              title: Text('Better Showcase'),
              selected:
                  RoutingHelper.currentRoute == RoutingHelper.betterShowcase,
              onTap: () => RoutingHelper.drawerNavigation(
                  context, RoutingHelper.betterShowcase),
            ),
            Divider(),
            ListTile(
              title: Text('Examples'),
              selected: RoutingHelper.currentRoute == RoutingHelper.examples,
              onTap: () => RoutingHelper.drawerNavigation(
                  context, RoutingHelper.examples),
            ),
          ],
        ),
      ),
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
                child: SizedBox(
                  height: maxHeight,

                  /// Using Align because the Container is inside
                  /// a ListView and will therefore be "stretched"
                  /// horizontally on default - Align does counter
                  /// this behaviour
                  child: Align(
                    /// The actual container widget we are manipulating here
                    /// and is shown s the first item in this view. All the upcoming
                    /// widgets are used to change the values of the properties
                    /// of this container
                    child: Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                          color: _colorType == 'Dropdown'
                              ? _colorDropdown
                              : Color.fromARGB(
                                  int.parse(_colorAController.text),
                                  int.parse(_colorRController.text),
                                  int.parse(_colorGController.text),
                                  int.parse(_colorBController.text),
                                ),
                          borderRadius: _shape == BoxShape.rectangle
                              ? BorderRadius.all(
                                  Radius.circular(_radius),
                                )
                              : null,
                          shape: _shape,
                          boxShadow: _shadow),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Height:'),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: maxHeight,
                      value: _height,
                      label: '${_height.round()}',
                      divisions: maxHeight.toInt(),
                      onChanged: (height) => setState(() => _height = height),
                    ),
                  ),
                  Container(
                    width: 50.0,
                    child: Text('${_height.round()} px'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Width:'),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: maxWidth,
                      value: _width,
                      label: '${_width.round()}',
                      divisions: maxWidth.toInt(),
                      onChanged: (width) => setState(() => _width = width),
                    ),
                  ),
                  Container(
                    width: 50.0,
                    child: Text('${_width.round()} px'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 'Dropdown',
                    groupValue: _colorType,
                    onChanged: (val) => setState(() => _colorType = val),
                  ),
                  Text('Dropdown'),
                  Radio(
                    value: 'ARGB',
                    groupValue: _colorType,
                    onChanged: (val) => setState(() => _colorType = val),
                  ),
                  Text('ARGB'),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Color:'),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: _colorType == 'Dropdown'
                          ? DropdownButton(
                              value: _colorDropdown,
                              items: ColorHelper.availableColors.keys
                                  .map(
                                    (colorKey) => DropdownMenuItem(
                                      child: Text(colorKey),
                                      value:
                                          ColorHelper.availableColors[colorKey],
                                    ),
                                  )
                                  .toList(),
                              onChanged: (color) =>
                                  setState(() => _colorDropdown = color),
                            )
                          : Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 75.0),
                                    child: TextField(
                                      controller: _colorAController,
                                      maxLength: 3,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          if (int.parse(newValue.text) > 255) {
                                            _colorAController.text =
                                                oldValue.text;
                                            return oldValue;
                                          }
                                          return newValue;
                                        })
                                      ],
                                      decoration: InputDecoration(
                                        counterText: 'A',
                                      ),
                                      onChanged: (_) => setState(() {}),
                                    ),
                                  ),
                                ),
                                Container(width: 25.0),
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 75.0),
                                    child: TextField(
                                      controller: _colorRController,
                                      maxLength: 3,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          if (int.parse(newValue.text) > 255) {
                                            _colorRController.text =
                                                oldValue.text;
                                            return oldValue;
                                          }
                                          return newValue;
                                        })
                                      ],
                                      decoration: InputDecoration(
                                        counterText: 'R',
                                      ),
                                      onChanged: (_) => setState(() {}),
                                    ),
                                  ),
                                ),
                                Container(width: 25.0),
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 75.0),
                                    child: TextField(
                                      controller: _colorGController,
                                      maxLength: 3,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          if (int.parse(newValue.text) > 255) {
                                            _colorGController.text =
                                                oldValue.text;
                                            return oldValue;
                                          }
                                          return newValue;
                                        })
                                      ],
                                      decoration: InputDecoration(
                                        counterText: 'G',
                                      ),
                                      onChanged: (_) => setState(() {}),
                                    ),
                                  ),
                                ),
                                Container(width: 25.0),
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 75.0),
                                    child: TextField(
                                      controller: _colorBController,
                                      maxLength: 3,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          if (int.parse(newValue.text) > 255) {
                                            _colorBController.text =
                                                oldValue.text;
                                            return oldValue;
                                          }
                                          return newValue;
                                        })
                                      ],
                                      decoration: InputDecoration(
                                        counterText: 'B',
                                      ),
                                      onChanged: (_) => setState(() {}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Border:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
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
                          ? (radius) =>
                              setState(() => _radius = radius.toDouble())
                          : null,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Shape:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
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
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: Text('Shadow:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
