import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_static_bottom_navigation_bar/core/enums/bottom_nav_item_enums.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';

part 'bottom_navbar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
      : super(
          const BottomNavBarState(selectedItem: BottomNavItem.homepage),
        );

  void updateSelectedItem(BottomNavItem item) {
    if (item != state.selectedItem) {
      emit(BottomNavBarState(selectedItem: item));
    }
  }
}
