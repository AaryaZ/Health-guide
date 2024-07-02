//error
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyReportScreen extends StatelessWidget {
  final String profileImagePath = 'assets/profile_avatar.png';
  final int calories = 2398;
  final int waterGlasses = 7;
  final int burnedCalories = 897;
  final int steps = 9997;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Report'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileImagePath),
                  radius: 40.0,
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rohan Patil',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text('93% Complete', style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 4.0),
                    LinearProgressIndicator(value: 0.93, minHeight: 8.0),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ReportCard(
                icon: Icons.fastfood,
                value: '$calories Kcal',
                label: 'Calories'),
            ReportCard(
                icon: Icons.local_drink,
                value: '$waterGlasses Glasses',
                label: 'Water'),
            ReportCard(
                icon: Icons.whatshot,
                value: '$burnedCalories Kcal',
                label: 'Burned'),
            ReportCard(
                icon: Icons.directions_walk,
                value: '$steps steps',
                label: 'Steps'),
            SizedBox(height: 16.0),
            Expanded(
              child: ProgressChart(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  ReportCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40.0),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Text(label, style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressChart extends StatelessWidget {
  final List<FlSpot> points = [
    FlSpot(0, 1),
    FlSpot(1, 3),
    FlSpot(2, 2),
    FlSpot(3, 4),
    FlSpot(4, 3),
    FlSpot(5, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: points,
            isCurved: true,
            color: Colors.blue,
            //barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
