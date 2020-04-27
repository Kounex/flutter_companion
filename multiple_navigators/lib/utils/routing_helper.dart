import 'package:multiple_navigators/views/browse/browse.dart';
import 'package:multiple_navigators/views/home/detail/detail.dart';
import 'package:multiple_navigators/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:multiple_navigators/views/library/library.dart';
import 'package:multiple_navigators/views/settings/settings.dart';
import 'package:multiple_navigators/views/tab_wrapper/tab_wrapper.dart';

enum AppRoutingKeys { TABS }

enum TabsRoutingKeys {
  HOME,
  HOME_DETAIL,

  BROWSE,

  LIBRARY,

  SETTINGS
}

extension AppRoutingKeysFunctions on AppRoutingKeys {
  String get route => const {
        AppRoutingKeys.TABS: '/tabs',
      }[this];
}

extension TabsRoutingKeysFunctions on TabsRoutingKeys {
  String get route => {
        TabsRoutingKeys.HOME: AppRoutingKeys.TABS.route + '/home',
        TabsRoutingKeys.HOME_DETAIL: AppRoutingKeys.TABS.route + '/home/detail',
        TabsRoutingKeys.BROWSE: AppRoutingKeys.TABS.route + '/browse',
        TabsRoutingKeys.LIBRARY: AppRoutingKeys.TABS.route + '/library',
        TabsRoutingKeys.SETTINGS: AppRoutingKeys.TABS.route + '/settings',
      }[this];
}

/// Used to summarize routing tasks and information at one point
class RoutingHelper {
  static String currentHomeTabRoute = TabsRoutingKeys.HOME.route;
  static String currentBrowseTabRoute = TabsRoutingKeys.BROWSE.route;
  static String currentLibraryTabRoute = TabsRoutingKeys.LIBRARY.route;
  static String currentSettingsTabRoute = TabsRoutingKeys.SETTINGS.route;

  static Map<String, Widget Function(BuildContext)> tabRoutes = {
    TabsRoutingKeys.HOME.route: (_) => HomeView(),
    TabsRoutingKeys.HOME_DETAIL.route: (_) => HomeDetailView(),
    TabsRoutingKeys.BROWSE.route: (_) => BrowseView(),
    TabsRoutingKeys.LIBRARY.route: (_) => LibraryView(),
    TabsRoutingKeys.SETTINGS.route: (_) => SettingsView(),
  };

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    AppRoutingKeys.TABS.route: (_) => TabWrapperView(),
  };
}
