import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_fiesta/shared/custom_drawer/custom_drawer.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            largeTitle: Text('Widget Fiesta'),
          )
        ],
      ),
    );
  }
}
