import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = "/edit_profile";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile Screen")),
      body: const Center(child: Text("Edit Profile Screen")),
    );
  }
}
