import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageScreen extends StatelessWidget {
  static const String routeName = "/homepage";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomePageScreen());
  }

  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Homepage")),
      body: const Center(child: Text("HomePage Screen")),
    );
  }
}
