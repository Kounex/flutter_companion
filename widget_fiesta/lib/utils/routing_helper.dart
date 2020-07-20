import 'package:flutter/material.dart';
import 'package:widget_fiesta/views/hero/hero.dart';
import 'package:widget_fiesta/views/hero/hero_detail/hero_detail.dart';
import 'package:widget_fiesta/views/landing/landing.dart';

/// Used to summarize routing tasks and information at one point
class RoutingHelper {
  /// Serves as a list of available routes, can be accessed
  /// directly as static properties
  static const String landing = '/landing';
  static const String hero = '/hero';
  static const String heroDetail = '/hero/detail';

  /// Name of the current route. The Navigator widget does not
  /// hold any information about the current route so we have
  /// to store this infirmation ourself if needed - in this case
  /// we don't want to route to a view if this route is already
  /// active (otherwise it gets resetted)
  static String currentRoute = landing;

  static Map<String, Widget Function(BuildContext)> drawerRoutes = {
    landing: (_) => LandingView(),
    hero: (_) => HeroView(),
  };

  static Map<String, Widget Function(BuildContext)> routes = {
    ...RoutingHelper.drawerRoutes,
    heroDetail: (_) => HeroDetailView(),
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
