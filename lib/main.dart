import 'package:flutter/material.dart';
import 'package:project_sofeng/Login_Screen/root_screen.dart';
import 'bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDG Adventure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

