import 'package:flutter/material.dart';

class HealthLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Log',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center align appbar text
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Make back icon white
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19,
            157), // Use the same blue color as the app bar background
      ),
      body: ListView(
        children: [
          buildHealthLogCard('Add Body Fat'),
          buildHealthLogCard('Add Muscle Mass'),
          buildHealthLogCard('Add Protein'),
        ],
      ),
    );
  }

  Widget buildHealthLogCard(String title) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.add), // Replace with your desired icon
      ),
    );
  }
}
