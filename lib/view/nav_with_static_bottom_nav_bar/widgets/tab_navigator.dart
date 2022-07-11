import 'package:flutter/material.dart';
import 'package:flutter_static_bottom_navigation_bar/core/init/navigation/navigation_route.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({Key? key, required this.navigatorKey, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateInitialRoutes: (_, __) {
        return [NavigationRoute.instance.onGenerateRoute(item)];
      },
      onGenerateRoute: NavigationRoute.instance.onGenerateNestedRoute,
    );
  }
}
