import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase/views/detail/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.laptop),
          onPressed: () {},
        ),
        title: Text('Nice'),
      ),
      body: ListView(
        children: <Widget>[
          Text('Test'),
          Align(
            child: GestureDetector(
              onDoubleTap: () => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (BuildContext context) => DetailView(),
                ),
              ),
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Double click me please'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
