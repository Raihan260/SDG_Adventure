import 'package:flutter/material.dart';
import 'Big_Quest/big_quest_page.dart';
import 'Shop/shop_page.dart';
import 'daily_quest_widget.dart'; // Impor widget baru

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Level 1", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Poin 1000", style: TextStyle(color: Colors.yellow.shade700, fontSize: 14)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),
              Text("Daily Quest", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),

              //DailyQuest------------------------------------------------------
              DailyQuestWidget(),

              //UI(Big Quest, Shop)---------------------------------------------
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavigationButton("Big Quest", Colors.red, Icons.book, context, BigQuestPage(), Colors.white),
                  _buildNavigationButton("    Shop    ", Colors.blue.shade900, Icons.shopping_bag, context, ShopPage(), Colors.yellow.shade700),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Button Function and Navigation(Big Quest, Shop)-----------------------------
  Widget _buildNavigationButton(String text, Color color, IconData icon, BuildContext context, Widget page, Color iconColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 40),
          SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
