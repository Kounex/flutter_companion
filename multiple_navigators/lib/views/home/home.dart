import 'package:flutter/cupertino.dart';
import 'package:multiple_navigators/shared/highlighted_text.dart';
import 'package:multiple_navigators/shared/icon_intro.dart';
import 'package:multiple_navigators/shared/info_card.dart';
import 'package:flutter/material.dart';
import 'package:multiple_navigators/utils/routing_helper.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Home'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                IconIntro(title: 'Multiple Navigators', icon: Icons.navigation),
                InfoCard(
                  title: 'Welcome!',
                  child: HighlightedText(
                      text:
                          'Usually we only use the given Navigator of MaterialApp to navigate through our Apps. Most use cases don\'t require additional ones since we always route on top level meaning every navigation will cover the whole Screen / App.\n\nOne popular use case where multiple Navigator are "needed" is using a BottomNavigationBar. To enable a user to navigate through an App we usually use two approaches: Drawer and BottomNavigationBar. Drawer was initially the Android way while BottomNavigationBar the iOS way. Now we use them as we like!\n\nBottomNavigationBar is special because it (usually) has to be present most of the time while navigating through the App. If we only use the Navigator of MaterialApp we will navigate the whole View (Widget) and therefore the BottomNavigationBar will not stay in place. By wrapping our initial Views for each with its own Navigator we can solve this issue!\n\nBut first we need to understand how the f*** this works...',
                      keywords: [
                        'Navigator',
                        'MaterialApp',
                        'BottomNavigationBar',
                        'Drawer'
                      ]),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: RaisedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(TabsRoutingKeys.HOME_DETAIL.route),
                      child: Text('Navigate'),
                    ),
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
