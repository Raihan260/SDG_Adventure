import 'package:flutter/material.dart';
import 'Home_Page/home_page.dart';
import 'Search_Page/search_page.dart';
import 'Profile_Page/profile_page.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),      // Halaman Home
    SearchPage(),    // Halaman Search
    ProfilePage(),   // Halaman Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.yellow.shade700,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue.shade900,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 50,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 50,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 50,),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
