import 'package:animations/shared/custom_drawer.dart';
import 'package:animations/shared/highlighted_text.dart';
import 'package:animations/shared/info_card.dart';
import 'package:animations/utils/routing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Direct'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                InfoCard(
                  title: 'Direct Animations',
                  child: HighlightedText(
                    text:
                        'With direct animations we want to achieve more advanced, timed, sequenced, customised animations, where implicit animations probably won\'t do the job\n\nIn this case we will have to create and maintain our own AnimationController which, as the name indicates, will give us the possibility to control the animation as desired.\n\nImplicit animations use them as well but are focused to animate the changing properties as soon as they actually change.\n\nTogether with so called Transition Widgets and the AnimationBuilder we will be able to animate as we like!\n\n... once we understand the concept',
                    keywords: [
                      'AnimationController',
                      'Transition',
                      'AnimationBuilder'
                    ],
                  ),
                ),
                Align(
                  child: RaisedButton(
                    child: Text('View Example'),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RoutingHelper.directImpl),
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
