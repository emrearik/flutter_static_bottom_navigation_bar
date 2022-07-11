import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_static_bottom_navigation_bar/core/init/navigation/navigation_route.dart';
import 'package:flutter_static_bottom_navigation_bar/view/category/views/category_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/homepage/views/home_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';
import 'package:flutter_static_bottom_navigation_bar/view/profile/views/profile_screen.dart';
import 'package:flutter_static_bottom_navigation_bar/view/word/views/word_page.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({Key? key, required this.navigatorKey, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            settings: const RouteSettings(name: tabNavigatorRoot),
            builder: (context) => _getScreen(context, item),
          ),
        ];
      },
      onGenerateRoute: NavigationRoute.instance.onGenerateNestedRoute,
    );
  }

  Widget _getScreen(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.homepage:
        return const HomePageScreen();
      case BottomNavItem.category:
        return const CategoryScreen();
      case BottomNavItem.word:
        return const WordScreen();
      case BottomNavItem.profile:
        return const ProfileScreen();
      default:
        return const Scaffold();
    }
  }
}
