import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase/stores/views/home.dart';
import 'package:showcase/views/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          Provider<HomeStore>(
            create: (_) => HomeStore(),
          ),
        ],
        child: HomeView(),
      ),
    );
  }
}
