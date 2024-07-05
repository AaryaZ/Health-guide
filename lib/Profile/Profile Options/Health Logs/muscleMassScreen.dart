import 'package:flutter/material.dart';

class MuscleMassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Muscle Mass',
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
      body: Card(
        margin: EdgeInsets.all(20),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Muscle Mass',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle update button press
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0), 
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0),
                  ),
                  minimumSize: Size(170, 40), // Adjust width here
                  backgroundColor: Color.fromARGB(255, 9, 19, 157),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
