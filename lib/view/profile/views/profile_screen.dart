import 'package:flutter/material.dart';
import 'package:flutter_static_bottom_navigation_bar/view/profile/views/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProfileScreen());
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Profile Screen"),
          ),
          MaterialButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProfileScreen.routeName),
            color: Colors.red,
            child: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}
