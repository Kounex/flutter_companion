import 'package:flutter/material.dart';
import 'package:widget_fiesta/utils/routing_helper.dart';
import 'package:widget_fiesta/views/landing/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Fiesta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutingHelper.currentRoute,
      routes: RoutingHelper.routes,
    );
  }
}
