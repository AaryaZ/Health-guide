import 'package:flutter/material.dart';
import 'package:health_guide/Profile/Profile%20Options/Settings/changeEmail.dart';
import 'package:health_guide/Profile/Profile%20Options/Settings/deleteAccScreen.dart';
// Import other necessary screens or widgets

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
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
      body: ListView(
        children: [
          buildAccountCard(context, 'Change Email', ChangeEmailScreen()),
          buildAccountCard(context, 'Delete Account', DeleteAccountScreen()), // Replace with your actual screen class
        ],
      ),
    );
  }

  Widget buildAccountCard(BuildContext context, String title, Widget screen) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
