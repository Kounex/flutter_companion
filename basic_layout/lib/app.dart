import 'package:basic_layout/views/home/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomeView(),
    );
  }
}
