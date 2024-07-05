import 'package:flutter/material.dart';

class TasksLeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks & Leaderboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19, 157),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSmallCard('Total Points', '50', 'assets/points.png'),
            SizedBox(height: 10),
            buildMediumCard('Leaderboard', 'Global Rank: 1,9929,0922', 'Local Rank: 32,0922'),
            SizedBox(height: 10),
            buildLargeCard('Today\'s Tasks', [
              {'task': 'Drink 1 glass of water', 'points': 5, 'assetPath': 'assets/water.png'},
              {'task': 'Walk 2k Steps', 'points': 5, 'assetPath': 'assets/walk_reminder.png'},
              {'task': '45 mins Cardio', 'points': 5, 'assetPath': 'assets/cardio.png'},
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSmallCard(String title, String points, String assetPath) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text(points, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Image.asset(assetPath, width: 20),
          ],
        ),
      ),
    );
  }

  Widget buildMediumCard(String heading, String globalRank, String localRank) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Image.asset('assets/globe.png', width: 40),
                  SizedBox(width: 10),
                  Text(globalRank),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Image.asset('assets/location.png', width: 40),
                  SizedBox(width: 10),
                  Text(localRank),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLargeCard(String heading, List<Map<String, dynamic>> tasks) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...tasks.map((task) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Image.asset(task['assetPath'], width: 40),
                    SizedBox(width: 10),
                    Text(task['task']),
                    Spacer(),
                    Text('+${task['points']} points'),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
