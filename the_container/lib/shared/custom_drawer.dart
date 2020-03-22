import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_container/utils/routing_helper.dart';
import 'package:the_container/views/basic_showcase/basic_showcase.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('The Container'),
            accountEmail: Text('Flutter Companion'),
            otherAccountsPictures: <Widget>[Icon(Icons.border_all)],
          ),
          ListTile(
            title: Text('Basic Showcase'),
            selected: RoutingHelper.currentRoute == RoutingHelper.basicShowcase,
            onTap: () => RoutingHelper.drawerNavigation(
                context, RoutingHelper.basicShowcase),
          ),
          Divider(),
          ListTile(
            title: Text('Better Showcase'),
            selected:
                RoutingHelper.currentRoute == RoutingHelper.betterShowcase,
            onTap: () => RoutingHelper.drawerNavigation(
                context, RoutingHelper.betterShowcase),
          ),
          Divider(),
          ListTile(
            title: Text('Examples'),
            selected: RoutingHelper.currentRoute == RoutingHelper.examples,
            onTap: () =>
                RoutingHelper.drawerNavigation(context, RoutingHelper.examples),
          ),
        ],
      ),
    );
  }
}
