import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DetailedProfileScreen extends StatefulWidget {
  @override
  State<DetailedProfileScreen> createState() => _DetailedProfileScreenState();
}

class _DetailedProfileScreenState extends State<DetailedProfileScreen> {
  final storage = FlutterSecureStorage();

  String? uName;
  String? uEmail;
  String? uGender;
  String? uPhone;
  String? uLocation;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final sname = await storage.read(key: 'userName');
    final semail = await storage.read(key: 'email');
    final sgender = await storage.read(key: 'gender');
    final sphone = await storage.read(key: 'phone');
    final slocation = await storage.read(key: 'location');
    setState(() {
      uName = sname;
      uEmail = semail;
      uGender = sgender;
      uPhone = sphone;
      uLocation = slocation;
    });
  }

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
              buildTextField('Name', '${uName}',
                  'assets/name_image.png'), // Use image asset
              buildTextField('Gender', '${uGender ?? 'Male'}',
                  'assets/gender_image.png'), // Use image asset
              buildTextField('Phone No', '${uPhone ?? '+91773684980'}',
                  'assets/phone_image.png'),
              buildTextField('Height', '5\'9"', 'assets/height_image.png'),
              buildTextField(
                  'Current Weight', '62.5 kgs', 'assets/weight_image.png'),
              buildTextField(
                  'Target Weight', '75', 'assets/target_weight_image.png'),
              buildTextField(
                  'Pace', '0.25 Kgs per week', 'assets/pace_image.png'),

              buildTextField('Location', '${uLocation ?? 'Bandra West'}',
                  'assets/location_image.png'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle edit button press
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
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
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color.fromARGB(255, 9, 19, 157),
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
