import 'package:basic_layout/shared/info_card.dart';
import 'package:basic_layout/views/detail/detail.dart';
import 'package:basic_layout/views/home/widgets/welcome_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[
          WelcomeIcon(),
          InfoCard(
            title: 'Welcome',
            text:
                'You managed to come here, nice! So you actually pulled this repo, compiled the code and deployed it on a phone (physical or emulator, whatever) - thats something to celebrate 🎉\n\nBut seriously: feel free to look through this project to see and understand how this (of many possible) structure is laid out!\n\nI added comments inside the actual dart files which should also help by explaining some stuff - have fun!',
          ),
          Align(
            child: RaisedButton(
              child: Text('Navigate'),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (_) => DetailView()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
