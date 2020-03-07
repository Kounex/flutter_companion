import 'package:basic_layout/shared/info_card.dart';
import 'package:basic_layout/views/detail/widgets/code_block.dart';
import 'package:flutter/material.dart';

/// A second view. Same explanation as for home applies here. In a bigger projects it
/// could be useful to lay out views in depth as well instead of all views being
/// in the root. So for eaxample if the detail view can only be accessed from home, the
/// structure could be:
///
/// views / home / detail / detail.dart
///
/// So we put views into views! For smaller projects it would be enough to put them
/// all in the root views folder.
class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: InfoCard(
              title: 'Hurray!',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'You made it to the second screen - nothing to see here to be honest. As you can see, since we did a navigation:'),
                  CodeBlock(
                    title: 'Flutter',
                    margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                    intentPerChild: [0],
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Navigation',
                              style: TextStyle(color: Colors.greenAccent),
                              // style: TextStyle(color: Colors.greenAccent),
                            ),
                            TextSpan(text: '.'),
                            TextSpan(
                              text: 'of',
                              style: TextStyle(color: Colors.yellowAccent),
                            ),
                            TextSpan(text: '(context)'),
                            TextSpan(text: '.'),
                            TextSpan(
                              text: 'push',
                              style: TextStyle(color: Colors.yellowAccent),
                            ),
                            TextSpan(text: '(...)'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                      'Therefore a back button in the app bar automatically appeared and will take you back to the first screen if tapped - isn\'t this great?!'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
