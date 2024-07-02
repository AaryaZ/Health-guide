import 'package:flutter/material.dart';

class TasksLeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks & Leaderboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Points', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Image.asset('assets/points.png', width: 20),
                  ],
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/global.png', width: 40),
                    title: Text('Global Rank: 1,9929,0922'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/local.png', width: 40),
                    title: Text('Local Rank: 32,0922'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Today\'s Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            buildTaskCard('Drink 1 glass of water', 5, 'assets/water.png'),
            buildTaskCard('Walk 2k Steps', 5, 'assets/walk.png'),
            buildTaskCard('45 mins Cardio', 5, 'assets/cardio.png'),
          ],
        ),
      ),
    );
  }

  Widget buildTaskCard(String task, int points, String assetPath) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Image.asset(assetPath, width: 40),
        title: Text(task),
        trailing: Text('+${points.toString()} points'),
      ),
    );
  }
}
