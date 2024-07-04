import 'package:flutter/material.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20&%20Support/chatSupportScreen.dart';

class HealthSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Support',
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
          buildHealthSupportCard(context, 'Chat Support'),
        ],
      ),
    );
  }

  Widget buildHealthSupportCard(BuildContext context, String title) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatSupportScreen()),
          );
        },
      ),
    );
  }
}

