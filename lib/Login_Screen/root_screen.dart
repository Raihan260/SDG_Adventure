import 'package:flutter/material.dart';
import 'package:project_sofeng/Login_Screen/login_page.dart';
import 'package:project_sofeng/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return BottomNavScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}