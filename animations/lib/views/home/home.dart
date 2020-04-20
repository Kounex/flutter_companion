import 'package:animations/shared/custom_drawer.dart';
import 'package:animations/shared/icon_intro.dart';
import 'package:animations/shared/info_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Home'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                IconIntro(title: 'Animations', icon: Icons.toll),
                InfoCard(
                  title: 'Welcome!',
                  text:
                      'One of the most important part of a good UI/UX is animations. Apps will enable its users different kind of interactions. In the long run the UI of apps will change according to changed views / states. Instead of those changes to apply instantly, we often want to make use of animations to enhance the overall experience.\n\nAnimations can be very complex and therefore can be implemented in many ways. You will see the implementation of some use cases in this example! App',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
