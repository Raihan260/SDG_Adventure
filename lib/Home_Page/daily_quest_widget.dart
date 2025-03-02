import 'package:flutter/material.dart';

// Model untuk Quest
class Quest {
  String title;
  int xp;
  int points;
  bool isCompleted;

  Quest({required this.title, required this.xp, required this.points, this.isCompleted = false});
}

class DailyQuestWidget extends StatefulWidget {
  @override
  _DailyQuestWidgetState createState() => _DailyQuestWidgetState();
}

class _DailyQuestWidgetState extends State<DailyQuestWidget> {
  // List quest yang nanti akan diambil dari database
  List<Quest> questList = [];

  @override
  void initState() {
    super.initState();
    _loadQuests(); // Simulasi pengambilan data dari database
  }

  // Simulasi mengambil data dari database
  void _loadQuests() {
    setState(() {
      questList = [
        Quest(title: "Buang sampah pada tempatnya", xp: 10, points: 8),
        Quest(title: "Menyiram tanaman", xp: 10, points: 8),
        Quest(title: "Berbagi pada sesama", xp: 10, points: 8),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.yellow.shade700,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(questList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(questList[index].title,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text("XP ${questList[index].xp}", style: TextStyle(color: Colors.white, fontSize: 14)),
                        SizedBox(width: 10),
                        Text("Poin ${questList[index].points}", style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Checkbox(
                  shape: CircleBorder(),
                  activeColor: Colors.yellow.shade700,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.yellow.shade700;
                    }
                    return Colors.white;
                  }),
                  value: questList[index].isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      questList[index].isCompleted = value!;
                    });
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
