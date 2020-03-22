import 'package:flutter/material.dart';
import 'package:the_container/views/basic_showcase/basic_showcase.dart';
import 'package:the_container/views/better_showcase/better_showcase.dart';
import 'package:the_container/views/examples/examples.dart';

/// Used to summarize routing tasks and information at one point
class RoutingHelper {
  /// Name of the current route. The Navigator widget does not
  /// hold any information about the current route so we have
  /// to store this infirmation ourself if needed - in this case
  /// we don't want to route to a view if this route is already
  /// active (otherwise it gets resetted)
  static String currentRoute = 'basic_showcase';

  /// Serves as a list of available routes, can be accessed
  /// directly as static properties
  static const basicShowcase = 'basic_showcase';
  static const betterShowcase = 'better_showcase';
  static const examples = 'exmaples';

  static Map<String, Widget Function(BuildContext)> routes = {
    basicShowcase: (_) => BasicShowcaseView(),
    betterShowcase: (_) => BetterShowcaseView(),
    examples: (_) => Examples(),
  };

  static void drawerNavigation(BuildContext context, String routeName) {
    if (currentRoute != routeName) {
      currentRoute = routeName;
      Navigator.of(context).pushReplacementNamed(routeName);
    } else {
      Navigator.of(context).pop();
    }
  }
}
