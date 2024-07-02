import 'package:flutter/material.dart';
import 'package:healthguide/Profile/measurementScreen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildListTile('Communication', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('Units & Measures', UnitsMeasurementsScreen()),
                  _buildDivider(),
                  _buildListTile('Refresh', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('About us', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('App version', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('Privacy Policy', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('Help', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('Account', ReportsPage()),
                  _buildDivider(),
                  _buildListTile('Logout', ReportsPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, Widget page) {
    return ListTile(
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
