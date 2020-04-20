import 'package:animations/shared/custom_drawer.dart';
import 'package:animations/shared/highlighted_text.dart';
import 'package:animations/shared/info_card.dart';
import 'package:animations/utils/routing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Implicit'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                InfoCard(
                  title: 'Implicit Animations',
                  child: HighlightedText(
                    text:
                        'Flutter implemented some Widgets with the prefix Animated - like AnimatedContainer - to enable visualization of changing properties.\n\nAfter certain actions take place (for example a user triggers an event or scrolls a defined threshold) we may want to change some UI elements. Instead of those changes to be applied instantly after rebuild (setState for example), we may want to show the changes in a more UX friendly way - this is where implicit animations come into place!',
                    keywords: [
                      'Animated',
                      'AnimatedContainer',
                    ],
                  ),
                ),
                Align(
                  child: RaisedButton(
                    child: Text('View Example'),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RoutingHelper.implicitImpl),
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
