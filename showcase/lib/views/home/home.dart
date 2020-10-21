import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:showcase/models/user.dart';
=======
import 'package:provider/provider.dart';
>>>>>>> 1277207f8b66e5b49e3b46892650f323c63ec75f
import 'package:showcase/stores/views/home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    HomeStore homeStore = Provider.of<HomeStore>(context, listen: false);
    print('test');

    return Scaffold(
      body: Consumer<HomeStore>(
        builder: (context, homeStore, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Home'),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  homeStore.userList.map((user) => Text(user.name)).toList(),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => homeStore.addUser('Hannes', 'Hamburg'),
>>>>>>> 1277207f8b66e5b49e3b46892650f323c63ec75f
      ),
    );
  }
}
