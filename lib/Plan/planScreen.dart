import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plans',
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
    );
  }
}

