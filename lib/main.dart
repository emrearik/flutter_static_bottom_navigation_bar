import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_static_bottom_navigation_bar/core/init/navigation/navigation_route.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/cubit/bottom_navbar_cubit.dart';
import 'package:flutter_static_bottom_navigation_bar/view/nav_with_static_bottom_nav_bar/navscreen_with_static_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavBarCubit>(
            create: (context) => BottomNavBarCubit(),
          )
        ],
        child: NavScreenWithStaticBottomNavBar(),
      ),
    );
  }
}
