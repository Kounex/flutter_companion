import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('test'),
        title: Text('Detail'),
      ),
      body: Builder(
        builder: (context) => GestureDetector(
          onLongPress: () => showBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 100.0,
              width: 500.0,
              color: Colors.blue,
              child: Text('TEST'),
            ),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
