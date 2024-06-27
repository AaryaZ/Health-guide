import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location.dart';

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool allowNotifications = false;
  bool allowReminder = false;

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
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06), // 5% of screen width as horizontal padding
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 0.15), // 10% of screen width as top margin
                Text(
                  "You're Almost there!",
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.06, // 6% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.01), // 2% of screen width as vertical spacing
                Text(
                  "We’re so happy you're here.",
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.028, // 4% of screen width as font size
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenWidth * 0.1), // 8% of screen width as vertical spacing
                Text(
                  'Permissions',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.045, // 4.5% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02), // 2% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width as horizontal padding
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
                SizedBox(height: screenWidth * 0.02), // 2% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width as horizontal padding
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
                SizedBox(height: screenWidth * 0.5), // 8% of screen width as vertical spacing
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10328C),
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04), // 4% of screen width as vertical padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.025), // 2.5% of screen width as border radius
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.04, // 4.5% of screen width as font size
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5), // 5% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015, // Increase height by 2 pixels
                    width: double.infinity, // Take full width of the screen
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Rounded border radius
                      color: Colors.grey.shade300, // Background color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Clip content to rounded borders
                      child: LinearProgressIndicator(
                        value: 1,
                        backgroundColor: Colors.transparent, // Transparent background for rounded corners
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.05), // 5% of screen width as bottom margin
              ],
            ),
          ),
        ),
      ),
    );
  }
}
