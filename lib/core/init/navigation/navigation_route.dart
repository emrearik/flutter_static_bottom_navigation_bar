import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    print("Route: ${args.name}");
    switch (args.name) {
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("Not found"),
          ),
        );
    }
  }

  Route onGenerateNestedRoute(RouteSettings settings) {
    print('Nested Route: ${settings.name})');
    switch (settings.name) {
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Sistemde bir hata oluştu !")),
      ),
    );
  }
}
