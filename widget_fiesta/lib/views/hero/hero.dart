import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_fiesta/shared/custom_drawer/custom_drawer.dart';
import 'package:widget_fiesta/views/hero/hero_detail/hero_detail.dart';

class HeroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Align(
              child: Hero(
                transitionOnUserGestures: true,
                tag: 'container',
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'The container which will make the Hero Transition to the next page!',
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            child: RaisedButton(
              child: Text('Click to start the Transition!'),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => HeroDetailView(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
