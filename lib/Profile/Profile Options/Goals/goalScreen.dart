import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Goals',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
            GoalCard(
              title: 'Weight Goals',
              details: [
                {'label': 'Current Weight', 'value': '72 kg'},
                {'label': 'Target Weight', 'value': '79 kg'},
              ],
            ),
            SizedBox(height: 16.0),
            GoalCard(
              title: 'Water Goal',
              details: [
                {'label': 'Daily Water Goal', 'value': '5 glasses'},
              ],
            ),
            SizedBox(height: 16.0),
            GoalCard(
              title: 'Step Goal',
              details: [
                {'label': 'Daily Step Goal', 'value': '10,000 steps'},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>> details;

  GoalCard({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Column(
              children: details.map((detail) {
                return Container(
                  color: Color.fromARGB(255, 195, 192, 192), // Light grey background color
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(detail['label']!,
                            style: TextStyle(fontSize: 14.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(detail['value']!,
                            style: TextStyle(fontSize: 14.0)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
