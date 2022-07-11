import 'package:flutter/material.dart';
import 'package:flutter_static_bottom_navigation_bar/view/category/views/category_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/homepage/views/home_page.dart';
import 'package:flutter_static_bottom_navigation_bar/view/profile/views/profile_screen.dart';
import 'package:flutter_static_bottom_navigation_bar/view/word/views/word_page.dart';

class NavScreenWithBottomNavBar extends StatefulWidget {
  NavScreenWithBottomNavBar({Key? key}) : super(key: key);

  @override
  State<NavScreenWithBottomNavBar> createState() =>
      _NavScreenWithBottomNavBarState();
}

class _NavScreenWithBottomNavBarState extends State<NavScreenWithBottomNavBar> {
  int selectedIndex = 0;

  final List pages = [
    const HomePageScreen(),
    const CategoryScreen(),
    const WordScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.wordpress), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
