import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 249),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Hello User!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notification button click
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'How do you feel today?',
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              SizedBox(height: 16),
              Card(
                color: Color.fromARGB(255, 9, 19, 157),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Plan",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              label: Text('Start',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 9, 19, 157))),
                              icon: Icon(Icons.arrow_forward,
                                  color: Color.fromARGB(255, 9, 19, 157)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 130,
                        height: 130,
                        child: Image.asset(
                          'assets/dumbell.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle calories card click
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 22, right: 22, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calories',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total Calories consumed today',
                              style: TextStyle(color: Colors.black45),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 2.7,
                                    child: CircularProgressIndicator(
                                      value: 0.8, // Adjust this value as needed
                                      strokeWidth: 4.0,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 9, 19, 157)),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '2,894',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Remaining',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 45),
                              Text(
                                'Carbs',
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                width: 300,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: 0.7,
                                    minHeight: 10,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Fats',
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                width: 300,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: 0.6,
                                    minHeight: 10,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Protein',
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                width: 300,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: 0.5,
                                    minHeight: 10,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                color: Color.fromARGB(255, 9, 19, 157),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Scan Your Food",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add,
                            color: Color.fromARGB(255, 9, 19, 157),
                            size: 30,
                            weight: 700),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InfoCard(
                      title: 'Steps',
                      value: '4,444',
                      goal: '10,000',
                      imagePath: 'assets/steps.png',
                      progressValue: 0.44,
                    ),
                    InfoCard(
                      title: 'Sleep',
                      value: '7hrs 44mins',
                      goal: '8hrs',
                      imagePath: 'assets/sleep.png',
                      progressValue: 0.97,
                    ),
                    InfoCard(
                      title: 'Water',
                      value: '3 ounces',
                      goal: '8 ounces',
                      imagePath: 'assets/water.png',
                      progressValue: 0.375,
                    ),
                    InfoCard(
                      title: 'Medicine',
                      value: '7 tablets',
                      goal: '7 tablets',
                      imagePath: 'assets/medicine.png',
                      progressValue: 1.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Heart Rate'),
                      subtitle: Text('Your Heart today'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '56-189 BPM',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text('5 - 11 Jan 2024'),
                          SizedBox(height: 8),
                          Container(
                            height: 150,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Respiration'),
                      subtitle: Text('Your Lungs today'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '8 breaths/min',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text('Jun 12 - Jul 12, 2021'),
                          SizedBox(height: 8),
                          Container(
                            height: 150,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String goal;
  final String imagePath;
  final double progressValue;

  InfoCard({
    required this.title,
    required this.value,
    required this.goal,
    required this.imagePath,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 4.5,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green),
                  ),
                ),
                Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Goal: $goal",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  value.isNotEmpty ? "Achieved: $value" : "",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
