import 'package:flutter/material.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20&%20Support/healthSupport.dart';
import 'package:health_guide/Profile/Profile%20Options/Task%20and%20Leaderboard/tasksScreen.dart';
import 'package:health_guide/Profile/detailedProfile.dart';
import 'package:health_guide/Profile/Profile%20Options/Goals/goalScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20Logs/healthLogScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Reminder/reminderScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Reports/reportsScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Settings/settingsScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Snap%20Gallery/snapGallery.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Rohan"; // This should be fetched from your database
  String invitationCode =
      "896fga7s5"; // This should be fetched from your database
  String profileImageUrl =
      "assets/profile_avatar.png"; // This should be fetched from your database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi $userName!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedProfileScreen()),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Edit Profile ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.edit, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImageUrl),
                    radius: 25,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(18.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 9, 19, 157),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invite your friends!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Win exciting rewards via referral codes',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            invitationCode,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          IconButton(
                            icon: Icon(Icons.copy, color: Colors.white),
                            onPressed: () {
                              // Copy code to clipboard
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/invite_friend.png',
                    height: 90, // Adjust the height as needed
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildListTile(
                      'Health Logs', Icons.assignment, HealthLogScreen()),
                  _buildDivider(),
                  _buildListTile('Reports', Icons.insert_chart, ReportScreen()),
                  _buildDivider(),
                  _buildListTile('Reminder', Icons.alarm, RemindersScreen()),
                  _buildDivider(),
                  _buildListTile('Goals', Icons.flag, GoalScreen()),
                  _buildDivider(),
                  _buildListTile('Task & Leaderboards', Icons.star,
                      TasksLeaderboardScreen()),
                  _buildDivider(),
                  _buildListTile(
                      'Snap Gallery', Icons.photo, SnapGalleryScreen()),
                  _buildDivider(),
                  _buildListTile('Active Plan', Icons.key,
                      ActivePlanPage()),
                  _buildDivider(),
                  _buildListTile(
                      'Health & Support', Icons.headphones, HealthSupportScreen()),
                  _buildDivider(),
                  _buildListTile('Settings', Icons.settings, SettingScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1.0,
      height: 0.0,
    );
  }
}

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Center(
        child: Text('Reports Page'),
      ),
    );
  }
}

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: Center(
        child: Text('Goals Page'),
      ),
    );
  }
}

class TaskLeaderboardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task & Leaderboards'),
      ),
      body: Center(
        child: Text('Task & Leaderboards Page'),
      ),
    );
  }
}

class SnapGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snap Gallery'),
      ),
      body: Center(
        child: Text('Snap Gallery Page'),
      ),
    );
  }
}

class ActivePlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Plan'),
      ),
      body: Center(
        child: Text('Active Plan Page'),
      ),
    );
  }
}

class HealthSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health & Support'),
      ),
      body: Center(
        child: Text('Health & Support Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
