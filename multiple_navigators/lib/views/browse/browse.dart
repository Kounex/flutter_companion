import 'package:flutter/material.dart';

class BrowseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Browse'),
          ),
        ],
      ),
    );
  }
}
