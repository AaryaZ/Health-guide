import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/otp_screen.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  final String phone;
  final String email;
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  final double height;
  final String medicalcondition;
  PermissionScreen({
    required this.phone,
    required this.email,
    required this.name,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
    required this.activity,
    required this.height,
    required this.medicalcondition,
  });
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool allowNotifications = false;
  bool allowReminder = false;

//----------------------------------
//register api call
  Future<void> registerUser() async {
    String apiUrl =
        'https://health-guide-backend.onrender.com/api/auth/register/';

    //  payload
    Map<String, dynamic> body = {
      'name': widget.name,
      'email': widget.email,
      'location': widget.location,
      'language': widget.language,
      'gender': widget.gender,
      'age': widget.age,
      'active_time': widget.activity,
      'height': widget.height,
      'medical_condition': widget.medicalcondition,
      'phoneNumber': widget.phone,
    };

    //storing in local storage
    final storage = FlutterSecureStorage();

    await storage.write(key: 'email', value: widget.email);
    await storage.write(key: 'gender', value: widget.gender);
    await storage.write(key: 'phone', value: widget.phone);
    await storage.write(key: 'location', value: widget.location);
    //---------------------------------------------------

    try {
      // Make POST request
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      // Check response
      if (response.statusCode == 200) {
        print(body['phoneNumber']);
        print("Registered user");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    phone: body['phoneNumber'],
                  )),
        );
      } else {
        // Handle error scenario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarHG(
            title: "Registration Failed",
            text: "Please try again later.",
          ).show(),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHG(
          title: "Network Error",
          text: "Failed to connect to the server. Please check your network.",
        ).show(),
      );
    }
  }
//--------------------------------------

  Future<void> _showNotificationPermissionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification Permission'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This app would like to send you notifications.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Deny'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Allow'),
              onPressed: () async {
                // Request notification permission
                var status = await Permission.notification.request();
                if (status.isGranted) {
                  setState(() {
                    allowNotifications = true;
                  });
                } else {
                  setState(() {
                    allowNotifications = false;
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _openAppSettings() async {
    await openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.04,
            horizontal:
                screenWidth * 0.05), // 5% of screen width as horizontal padding
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height:
                        screenWidth * 0.1), // 10% of screen width as top margin
                Text(
                  "You're Almost there!",
                  style: GoogleFonts.inter(
                    fontSize:
                        screenWidth * 0.06, // 6% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.01), // 2% of screen width as vertical spacing
                Text(
                  "We’re so happy you're here.",
                  style: GoogleFonts.inter(
                    fontSize:
                        screenWidth * 0.028, // 4% of screen width as font size
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.1), // 8% of screen width as vertical spacing
                Text(
                  'Permissions',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth *
                        0.045, // 4.5% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.02), // 2% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth *
                          0.04), // 4% of screen width as horizontal padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Allow Notifications',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                      Switch(
                        value: allowNotifications,
                        onChanged: (bool value) {
                          if (value) {
                            _showNotificationPermissionDialog();
                          } else {
                            setState(() {
                              allowNotifications = value;
                            });
                          }
                        },
                        activeColor: Color(0xFF10328C),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.02), // 2% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth *
                          0.04), // 4% of screen width as horizontal padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reminder',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                      Switch(
                        value: allowReminder,
                        onChanged: (bool value) {
                          setState(() {
                            allowReminder = value;
                          });
                          if (value) {
                            _openAppSettings();
                          }
                        },
                        activeColor: Color(0xFF10328C),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.42),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      registerUser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10328C),
                      padding: EdgeInsets.symmetric(
                          vertical: screenWidth *
                              0.04), // 4% of screen width as vertical padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth *
                            0.025), // 2.5% of screen width as border radius
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth *
                            0.04, // 4.5% of screen width as font size
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.09),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade400,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.99,
                        backgroundColor: Colors.transparent,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
