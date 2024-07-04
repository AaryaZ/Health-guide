import 'package:flutter/material.dart';
import 'package:health_guide/Plan/planScreen.dart';
import 'package:health_guide/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TrackerData> trackers = [
    TrackerData(
        title: 'Steps',
        value: '4,444',
        goal: '10,000',
        imagePath: 'assets/steps.png',
        progressValue: 0.44),
    TrackerData(
        title: 'Sleep',
        value: '7hrs 44mins',
        goal: '8hrs',
        imagePath: 'assets/sleep.png',
        progressValue: 0.97),
    TrackerData(
        title: 'Water',
        value: '3 ounces',
        goal: '8 ounces',
        imagePath: 'assets/water.png',
        progressValue: 0.375),
    TrackerData(
        title: 'Medicine',
        value: '7 tablets',
        goal: '7 tablets',
        imagePath: 'assets/medicine.png',
        progressValue: 1.0),
  ];

  final List<TransformationData> transformations = [
    TransformationData(
        beforeImage: 'assets/before1.png',
        afterImage: 'assets/after1.png',
        description: 'Weight loss in 3 months'),
    TransformationData(
        beforeImage: 'assets/before2.png',
        afterImage: 'assets/after2.png',
        description: 'Muscle gain in 6 months'),
    TransformationData(
        beforeImage: 'assets/before3.png',
        afterImage: 'assets/after3.png',
        description: 'Fat loss in 4 months'),
  ];

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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanScreen()));
                              },
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
                  children: trackers.map((tracker) {
                    return InfoCard(
                      title: tracker.title,
                      value: tracker.value,
                      goal: tracker.goal,
                      imagePath: tracker.imagePath,
                      progressValue: tracker.progressValue,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HealthCard(
                      title: 'Heart Rate',
                      subtitle: 'Your Heart today',
                      value: '56-189 BPM',
                      date: '5 - 11 Jan 2024',
                      imagePath: 'assets/graph_img1.png',
                    ),
                    HealthCard(
                      title: 'Respiration',
                      subtitle: 'Your Lungs today',
                      value: '8 breaths/min',
                      date: 'Jun 12 - Jul 12, 2021',
                      imagePath: 'assets/graph_img2.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                'User Trackers',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: [
                  TrackerCircularProgress(
                      title: 'Weight', value: 0.75, displayValue: '75 Kgs'),
                  TrackerCircularProgress(
                      title: 'Body Fat %', value: 0.25, displayValue: '25%'),
                  TrackerCircularProgress(
                      title: 'Muscle Mass',
                      value: 0.50,
                      displayValue: '39 Kgs'),
                  TrackerCircularProgress(
                      title: 'BMI', value: 0.7, displayValue: '22.5'),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Transformations',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: transformations.map((transformation) {
                    return TransformationCard(
                      beforeImage: transformation.beforeImage,
                      afterImage: transformation.afterImage,
                      description: transformation.description,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle edit button press
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color.fromARGB(255, 9, 19, 157),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackerData {
  final String title;
  final String value;
  final String goal;
  final String imagePath;
  final double progressValue;

  TrackerData({
    required this.title,
    required this.value,
    required this.goal,
    required this.imagePath,
    required this.progressValue,
  });
}

class TransformationData {
  final String beforeImage;
  final String afterImage;
  final String description;

  TransformationData({
    required this.beforeImage,
    required this.afterImage,
    required this.description,
  });
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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

class HealthCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String date;
  final String imagePath;

  HealthCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(date, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Image.asset(imagePath, height: 120),
          ],
        ),
      ),
    );
  }
}

class TrackerCircularProgress extends StatelessWidget {
  final String title;
  final double value;
  final String displayValue;

  TrackerCircularProgress({
    required this.title,
    required this.value,
    required this.displayValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2.3,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 5.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 9, 19, 157)),
                  ),
                ),
                Text(displayValue, style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransformationCard extends StatelessWidget {
  final String beforeImage;
  final String afterImage;
  final String description;

  TransformationCard({
    required this.beforeImage,
    required this.afterImage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(beforeImage, width: 90, height: 160),
                Image.asset(afterImage, width: 90, height: 160),
              ],
            ),
            SizedBox(height: 8),
            Text(description),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.favorite_border),
            ),
          ],
        ),
      ),
    );
  }
}
