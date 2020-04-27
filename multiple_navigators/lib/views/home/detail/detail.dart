import 'package:flutter/material.dart';

class HomeDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Detail'),
          ),
        ],
      ),
    );
  }
}
