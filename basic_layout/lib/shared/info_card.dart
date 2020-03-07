import 'package:flutter/material.dart';

/// The shared folder is used for widgets which will be used throughout the app. It is
/// good practice to have a "theme" / "style" for a app which follows a pattern. Bad example
/// would be something like card widgets which are being used on several places in the
/// app and if the developer doesn't create a "template card" widget and always creates
/// a new widget class, he has to change properties of each widget manually and they could
/// look /behave differently it not maintained correctly.
///
/// To summarize: Always think about generalizing widgets, write them to be multi-purpose
/// and use them as often as possible before deciding to write another one
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
