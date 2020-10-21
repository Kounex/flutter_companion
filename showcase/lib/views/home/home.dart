import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:showcase/models/user.dart';
import 'package:showcase/stores/views/home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Provider.of<HomeStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          print('test');
          return Text(homeStore.text);
        }),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) => Column(
              children:
                  homeStore.userList.map((user) => Text(user.name)).toList(),
            ),
          ),
          RaisedButton(
            onPressed: () => homeStore.addUser(User(name: 'Test', address: '')),
            child: Text('Add User'),
          ),
        ],
      ),
    );
  }
}
