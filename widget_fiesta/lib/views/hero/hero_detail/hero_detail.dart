import 'package:flutter/material.dart';

class HeroDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Detail'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 64.0),
        children: [
          Align(
            child: Hero(
              transitionOnUserGestures: true,
              tag: 'container',
              child: Container(
                color: Colors.red,
                height: 200,
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Align(
              child: Text(
                'beautiful.',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 42.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
