import 'package:flutter/material.dart';

class DetailedProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 6),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_avatar.png'),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20),
              buildTextField('Name', 'Rohan Patil',
                  'assets/name_image.png'), // Use image asset
              buildTextField('Gender', 'Male',
                  'assets/gender_image.png'), // Use image asset
              buildTextField(
                  'Phone No', '+7738987289', 'assets/phone_image.png'),
              buildTextField('Height', '5\'9"', 'assets/height_image.png'),
              buildTextField(
                  'Current Weight', '62.5 kgs', 'assets/weight_image.png'),
              buildTextField(
                  'Target Weight', '75', 'assets/target_weight_image.png'),
              buildTextField(
                  'Pace', '0.25 Kgs per week', 'assets/pace_image.png'),
              buildTextField('Medical Condition', 'Diabetes',
                  'assets/medical_condition_image.png'),
              buildTextField(
                  'Location', 'Bandra W', 'assets/location_image.png'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle edit button press
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0), 
                  child: Text(
                    'Edit',
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
                  minimumSize: Size(double.infinity,
                      50), 
                  backgroundColor: Color.fromARGB(255, 9, 19,
                      157), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String value, String iconPath) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: TextEditingController(text: value),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
