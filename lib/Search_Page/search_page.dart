import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman pencarian',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
