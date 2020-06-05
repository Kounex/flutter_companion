import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase/stores/views/home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
