import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase/stores/views/home.dart';
import 'package:showcase/views/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeStore>(
      create: (context) => HomeStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: HomeView(),
      ),
    );
  }
}
