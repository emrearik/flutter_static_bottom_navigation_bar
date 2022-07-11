import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WordScreen extends StatelessWidget {
  static const String routeName = "/word";

  const WordScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Word Screen")),
      body: const Center(child: Text("Word Screen")),
    );
  }
}
