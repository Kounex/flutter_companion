import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingImagePath;
  final Widget routingWidget;

  CustomListTile(
      {@required this.title,
      @required this.subtitle,
      this.leadingImagePath,
      this.routingWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.leadingImagePath != null
          ? Align(
              widthFactor: 1.0,
              child: Hero(
                transitionOnUserGestures: true,
                tag: this.leadingImagePath,
                child: Image.asset(
                  this.leadingImagePath,
                  width: 75.0,
                ),
              ),
            )
          : null,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(this.title),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(this.subtitle),
      ),
      dense: true,
      onTap: this.routingWidget != null
          ? () => Navigator.of(context).push(
                // CupertinoPageRoute(builder: (_) => this.routingWidget),
                CupertinoPageRoute(builder: (_) => this.routingWidget),
              )
          : null,
    );
  }
}
