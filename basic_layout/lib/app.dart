import 'package:basic_layout/views/home/home.dart';
import 'package:flutter/material.dart';

/// Entry point for the main. Usually (like most of the time) we wrap the app with a
/// MaterialApp widget which handles a lot of basic stuff like providing a navigator,
/// action, you name it. In the future you might wrap this with stuff related to your
/// state management solution, but this is the way to go for now!
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
