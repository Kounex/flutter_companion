import 'package:flutter/material.dart';
import 'package:widget_fiesta/utils/routing_helper.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                'Widget Fiesta',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            accountEmail: Text('Flutter Companion'),
            otherAccountsPictures: <Widget>[Icon(Icons.border_all)],
          ),
          ListTile(
            title: Text('Home'),
            selected: RoutingHelper.currentRoute == RoutingHelper.landing,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.landing),
          ),
          Divider(),
          ListTile(
            title: Text('Hero'),
            selected: RoutingHelper.currentRoute == RoutingHelper.hero,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.hero),
          ),
        ],
      ),
    );
  }
}
