import 'package:flutter/material.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20Logs/bodyFatScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20Logs/muscleMassScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Health%20Logs/proteinScreen.dart';

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
          buildHealthLogCard('Add Body Fat', context, BodyFatScreen()),
          buildHealthLogCard('Add Muscle Mass', context, MuscleMassScreen()),
          buildHealthLogCard('Add Protein', context, ProteinScreen()),
        ],
      ),
    );
  }

  Widget buildHealthLogCard(String title, BuildContext context, Widget screen) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.add),
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
