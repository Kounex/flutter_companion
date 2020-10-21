import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:showcase/app.dart';

void main() {
  runApp(App());
=======
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
>>>>>>> 1277207f8b66e5b49e3b46892650f323c63ec75f
}
