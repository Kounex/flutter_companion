import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_examples/views/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: Colors.black54,
          textTheme: CupertinoThemeData().textTheme,
        ),
      ),
      theme: ThemeData.light(),
      home: HomeView(),
    );
  }
}
