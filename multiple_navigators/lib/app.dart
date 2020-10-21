import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData light = ThemeData.light();
    ThemeData dark = ThemeData.dark();

    return MaterialApp(
      theme: light.copyWith(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
      darkTheme: dark.copyWith(
        accentColor: Colors.deepPurpleAccent,
        toggleableActiveColor: Colors.deepPurpleAccent,
        highlightColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: dark.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[700],
          showUnselectedLabels: true,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutingKeys.TABS.route,
      routes: RoutingHelper.appRoutes,
    );
  }
}
