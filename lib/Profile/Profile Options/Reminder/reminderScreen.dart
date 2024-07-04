import 'package:flutter/material.dart';
import 'package:health_guide/Profile/Profile%20Options/Reminder/foodReminderScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Reminder/medicineReminderScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Reminder/walkReminderScreen.dart';
import 'package:health_guide/Profile/Profile%20Options/Reminder/waterReminderScreen.dart';

class RemindersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminders',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19, 157), 
      ),
      body: ListView(
        children: [
          buildReminderCard('Food Reminder', 'assets/food_reminder.png', context, FoodReminderScreen()),
          buildReminderCard('Water Reminder', 'assets/water.png', context, WaterReminderScreen()),
          buildReminderCard('Walk Reminder', 'assets/walk_reminder.png', context, WalkReminderScreen()),
          buildReminderCard('Medicine Reminder', 'assets/medicine_reminder.png', context, MedicineReminderScreen()),
        ],
      ),
    );
  }

  Widget buildReminderCard(String title, String assetPath, BuildContext context, Widget screen) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListTile(
        leading: Image.asset(assetPath, width: 45),
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
