import 'package:animations/utils/routing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                'Animations',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            accountEmail: Text('Flutter Companion'),
            otherAccountsPictures: <Widget>[Icon(Icons.border_all)],
          ),
          ListTile(
            title: Text('Home'),
            selected: RoutingHelper.currentRoute == RoutingHelper.home,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.home),
          ),
          Divider(),
          ListTile(
            title: Text('Implicit'),
            selected: RoutingHelper.currentRoute == RoutingHelper.implicit,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.implicit),
          ),
          Divider(),
          ListTile(
            title: Text('Direct'),
            selected: RoutingHelper.currentRoute == RoutingHelper.direct,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.direct),
          ),
        ],
      ),
    );
  }
}
