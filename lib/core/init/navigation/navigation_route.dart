import 'package:flutter/material.dart';
import 'package:flutter_static_bottom_navigation_bar/view/category/views/category_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/homepage/views/home_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';
import 'package:flutter_static_bottom_navigation_bar/view/profile/views/edit_profile_screen.dart';
import 'package:flutter_static_bottom_navigation_bar/view/profile/views/profile_screen.dart';
import 'package:flutter_static_bottom_navigation_bar/view/word/views/word_page.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.homepage:
        return HomePageScreen.route();
      case BottomNavItem.category:
        return CategoryScreen.route();
      case BottomNavItem.word:
        return WordScreen.route();
      case BottomNavItem.profile:
        return ProfileScreen.route();
      default:
        return _errorRoute();
    }
  }

  Route onGenerateNestedRoute(RouteSettings settings) {
    print('Nested Route: ${settings.name})');
    switch (settings.name) {
      case EditProfileScreen.routeName:
        return EditProfileScreen.route();
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
