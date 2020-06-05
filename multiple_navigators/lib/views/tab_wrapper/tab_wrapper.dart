import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiple_navigators/utils/routing_helper.dart';
import 'package:multiple_navigators/utils/list_extensions.dart';

class TabWrapperView extends StatefulWidget {
  @override
  _TabWrapperViewState createState() => _TabWrapperViewState();
}

class _TabWrapperViewState extends State<TabWrapperView> {
  int _currentTabIndex = 0;

  /// [GlobalKeys] used for the [Navigators] to manually trigger navigation
  /// and stuff
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  /// [HeroControllers] are extending [NavigatorObserver], a class which is
  /// used in [Navigators] for the [observer] property - enables [Hero] transitions!
  List<HeroController> _heroControllers;

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  List<Navigator> _tabViews;

  @override
  void initState() {
    _heroControllers = [
      HeroController(createRectTween: _createRectTween),
      HeroController(createRectTween: _createRectTween),
      HeroController(createRectTween: _createRectTween),
      HeroController(createRectTween: _createRectTween),
    ];
    _tabViews = [
      Navigator(
        key: _navigatorKeys[0],
        initialRoute: TabsRoutingKeys.HOME.route,
        onGenerateInitialRoutes: (state, route) => [
          CupertinoPageRoute(
            builder: RoutingHelper.tabRoutes[route],
          ),
        ],
        onGenerateRoute: (routeSettings) => CupertinoPageRoute(
          builder: RoutingHelper.tabRoutes[routeSettings.name],
          settings: routeSettings,
        ),
        observers: [_heroControllers[0]],
      ),
      Navigator(
        key: _navigatorKeys[1],
        initialRoute: TabsRoutingKeys.BROWSE.route,
        onGenerateInitialRoutes: (state, route) => [
          CupertinoPageRoute(
            builder: RoutingHelper.tabRoutes[route],
          ),
        ],
        onGenerateRoute: (routeSettings) => CupertinoPageRoute(
          builder: RoutingHelper.tabRoutes[routeSettings.name],
          settings: routeSettings,
        ),
        observers: [_heroControllers[1]],
      ),
      Navigator(
        key: _navigatorKeys[2],
        initialRoute: TabsRoutingKeys.LIBRARY.route,
        onGenerateInitialRoutes: (state, route) => [
          CupertinoPageRoute(
            builder: RoutingHelper.tabRoutes[route],
          ),
        ],
        onGenerateRoute: (routeSettings) => CupertinoPageRoute(
          builder: RoutingHelper.tabRoutes[routeSettings.name],
          settings: routeSettings,
        ),
        observers: [_heroControllers[2]],
      ),
      Navigator(
        key: _navigatorKeys[3],
        initialRoute: TabsRoutingKeys.SETTINGS.route,
        onGenerateInitialRoutes: (state, route) => [
          CupertinoPageRoute(
            builder: RoutingHelper.tabRoutes[route],
          ),
        ],
        onGenerateRoute: (routeSettings) => CupertinoPageRoute(
          builder: RoutingHelper.tabRoutes[routeSettings.name],
          settings: routeSettings,
        ),
        observers: [_heroControllers[3]],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _tabViews
            .mapIndexed(
              (navigator, index) => Offstage(
                offstage: index != _currentTabIndex,
                child: navigator,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) => setState(() {
          _currentTabIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icon: Icon(CupertinoIcons.news),
            title: Text('Browse'),
          ),
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icon: Icon(CupertinoIcons.book),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
