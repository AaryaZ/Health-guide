import 'package:flutter/material.dart';

class DailyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Daily Report',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_avatar.png'),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rohan Patil',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 200, // adjust as needed
                          height: 10,
                          child: LinearProgressIndicator(
                            value: 0.93,
                            backgroundColor: Colors.grey[300],
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text('93% Complete'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildStatCard('assets/food_reminder.png', '2,398', 'Kcal'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildStatCard('assets/water.png', '7', 'Glasses')),
                SizedBox(width: 10),
                Expanded(child: _buildStatCard('assets/burn.png', '897', 'Kcal')),
              ],
            ),
            SizedBox(height: 10),
            _buildStatCard('assets/steps.png', '9,997', 'Steps'),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'Progress Chart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset('assets/graph_img3.png'), // Adjust height as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String imagePath, String value, String unit) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40, height: 40),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(unit),
            ],
          ),
        ],
      ),
    );
  }
}
