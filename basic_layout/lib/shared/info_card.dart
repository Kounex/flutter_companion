import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  /// Will be displayed at the start, above the divider
  final String title;

  /// Main content for the card as text, will be displayed under the divider. Will only be used if no child is provided!
  final String text;

  /// Main content, used instead of text even if provided, and will be displayed under the divider
  final Widget child;
  final Color backgroundColor;
  final Color textColor;

  InfoCard(
      {@required this.title,
      this.text,
      this.child,
      this.backgroundColor,
      this.textColor})
      : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      color: this.backgroundColor ?? Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                fontSize: 24.0,
                color: this.textColor ??
                    Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            Divider(height: 24.0),
            this.child ??
                Text(
                  this.text,
                  style: TextStyle(
                    color: this.textColor ??
                        Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
