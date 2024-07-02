import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeartRateChart extends StatelessWidget {
  final List<FlSpot> heartRateData = [
    FlSpot(0, 70),
    FlSpot(1, 75),
    FlSpot(2, 60),
    FlSpot(3, 80),
    FlSpot(4, 65),
    FlSpot(5, 100),
    FlSpot(6, 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heart Rate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Heart today',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              '56-189 BPM',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              '5 - 11 Jan 2024',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    //leftTitles: SideTitles(showTitles: true),
                    //bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: heartRateData,
                      isCurved: true,
                      barWidth: 4,
                      color: Colors.redAccent,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.redAccent.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RespirationChart extends StatelessWidget {
  final List<FlSpot> respirationData = [
    FlSpot(0, 8),
    FlSpot(1, 9),
    FlSpot(2, 7),
    FlSpot(3, 8),
    FlSpot(4, 8.5),
    FlSpot(5, 7.5),
    FlSpot(6, 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Respiration',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Lungs today',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Daily Average',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '8 breaths/min',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jun 12 - Jul 12, 2021',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    //leftTitles: SideTitles(showTitles: true),
                    //bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: respirationData,
                      isCurved: true,
                      barWidth: 4,
                      color: Colors.blueAccent,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blueAccent.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
