import 'package:flutter/material.dart';
import 'package:the_container/utils/routing_helper.dart';
import 'package:the_container/views/basic_showcase/basic_showcase.dart';
import 'package:the_container/views/better_showcase/better_showcase.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BasicShowcaseView(),
      routes: RoutingHelper.routes,
    );
  }
}
