import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/cubit/bottom_navbar_cubit.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/widgets/custom_bottom_navigation.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/widgets/tab_navigator.dart';

enum BottomNavItem { homepage, category, word, profile }

class NavScreenWithStaticBottomNavBar extends StatelessWidget {
  static const String routeName = "/nav_screen";
  NavScreenWithStaticBottomNavBar({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider(
        create: (context) => BottomNavBarCubit(),
        child: NavScreenWithStaticBottomNavBar(),
      ),
    );
  }

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.homepage: GlobalKey<NavigatorState>(),
    BottomNavItem.category: GlobalKey<NavigatorState>(),
    BottomNavItem.word: GlobalKey<NavigatorState>(),
    BottomNavItem.profile: GlobalKey<NavigatorState>()
  };

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.homepage: Icons.home,
    BottomNavItem.category: Icons.category,
    BottomNavItem.word: Icons.wordpress,
    BottomNavItem.profile: Icons.person,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: items
                  .map(
                    (item, _) => MapEntry(
                      item,
                      _buildOffstageNavigator(item, item == state.selectedItem),
                    ),
                  )
                  .values
                  .toList(),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              items: items,
              selectedItem: state.selectedItem,
              onTap: (index) {
                final selectedItem = BottomNavItem.values[index];

                _selectBottomNavItem(
                    context, selectedItem, selectedItem == state.selectedItem);
              },
            ),
          );
        },
      ),
    );
  }

  void _selectBottomNavItem(
      BuildContext context, BottomNavItem selectedItem, bool isSameItem) {
    if (isSameItem) {
      navigatorKeys[selectedItem]!
          .currentState!
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(BottomNavItem currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}
