import 'package:animations/views/direct/direct.dart';
import 'package:animations/views/direct/direct_impl/direct_impl.dart';
import 'package:animations/views/home/home.dart';
import 'package:animations/views/implicit/implicit.dart';
import 'package:animations/views/implicit/implicit_impl/implicit_impl.dart';
import 'package:flutter/material.dart';

/// Used to summarize routing tasks and information at one point
class RoutingHelper {
  /// Name of the current route. The Navigator widget does not
  /// hold any information about the current route so we have
  /// to store this infirmation ourself if needed - in this case
  /// we don't want to route to a view if this route is already
  /// active (otherwise it gets resetted)
  static String currentRoute = 'home';

  /// Serves as a list of available routes, can be accessed
  /// directly as static properties
  static const home = 'home';
  static const implicit = 'implicit';
  static const implicitImpl = 'implicit_impl';
  static const direct = 'direct';
  static const directImpl = 'direct_impl';

  static Map<String, Widget Function(BuildContext)> drawerRoutes = {
    home: (_) => HomeView(),
    implicit: (_) => ImplicitView(),
    direct: (_) => DirectView(),
  };

  static Map<String, Widget Function(BuildContext)> routes = {
    ...RoutingHelper.drawerRoutes,
    implicitImpl: (_) => ImplicitImplView(),
    directImpl: (_) => DirectImplView(),
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
