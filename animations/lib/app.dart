import 'package:animations/utils/routing_helper.dart';
import 'package:animations/views/home/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        accentColor: Colors.deepPurpleAccent,
        toggleableActiveColor: Colors.deepPurpleAccent,
        highlightColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurpleAccent,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomeView(),
      routes: RoutingHelper.routes,
    );
  }
}
