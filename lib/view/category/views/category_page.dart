import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CategoryScreen());
  }

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category")),
      body: const Center(child: Text("Category Screen")),
    );
  }
}
