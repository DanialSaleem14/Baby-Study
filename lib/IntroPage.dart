import 'package:flutter/material.dart';
import 'level1page.dart';
import 'level2page.dart';
import 'level3page.dart';
import 'level4page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Levels'),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          Text('Select Your Level', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          SizedBox(height: 40),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Level1Page when Level 1 button is pressed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => level1page()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Level 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Level3Page when Level 3 button is pressed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => level3page()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Level 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Level2Page when Level 2 button is pressed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => level2page()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Level 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Level4Page when Level 4 button is pressed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => level4page()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Level 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
