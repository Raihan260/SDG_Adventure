import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman profil',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
