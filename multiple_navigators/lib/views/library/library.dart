import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Library'),
          ),
        ],
      ),
    );
  }
}
