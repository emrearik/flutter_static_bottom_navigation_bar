import 'package:flutter/material.dart';
import 'package:flutter_static_bottom_navigation_bar/core/enums/bottom_nav_item_enums.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Map<BottomNavItem, IconData> items;
  final BottomNavItem selectedItem;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {Key? key,
      required this.items,
      required this.selectedItem,
      required this.onTap})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: BottomNavItem.values.indexOf(widget.selectedItem),
      onTap: widget.onTap,
      items: widget.items
          .map((item, icon) {
            return MapEntry(
              item.toString(),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(icon),
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
