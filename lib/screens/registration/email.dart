import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/permissions.dart';
import 'package:healthguide/utils/snack_bar.dart';

class Email extends StatefulWidget {
  final String phone;
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  final double height;
  final String medicalcondition;
  Email({
    required this.name,
    required this.phone,
    required this.medicalcondition,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
    required this.activity,
    required this.height,
  });

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.03,
            horizontal:
                screenWidth * 0.06), // 5% of screen width as horizontal padding
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: screenWidth *
                        0.15), // 10% of screen width as top margin
                Text(
                  'Hey You!',
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
                  "We’re so glad you took this step. Let us you guide through this new journey towards your goal. Let’s start with your details!",
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
                  'Your Email',
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
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      borderSide: BorderSide(
                          color: Colors.white), // Transparent border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      borderSide: BorderSide(
                          color:
                              Color(0xFF10328C)), // Border color when focused
                    ),
                  ),
                ),

                SizedBox(
                    height: screenHeight *
                        0.46), // 8% of screen width as vertical spacing
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to LocationScreen.dart on button press
                      (_emailController.text.isEmpty)
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBarHG(
                                      title: "Oops!",
                                      text: "Please enter your email.")
                                  .show())
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PermissionScreen(
                                        email: _emailController.text,
                                        phone: widget.phone,
                                        name: widget.name,
                                        location: widget.location,
                                        language: widget.language,
                                        gender: widget.gender,
                                        age: widget.age,
                                        activity: widget.activity,
                                        height: widget.height,
                                        medicalcondition:
                                            widget.medicalcondition,
                                      )),
                            );
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
                SizedBox(
                    height: screenHeight *
                        0.05), // 5% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.09),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015, // Increase height by 2 pixels
                    width: double.infinity, // Take full width of the screen
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded border radius
                      color: Colors.grey.shade400, // Background color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Clip content to rounded borders
                      child: LinearProgressIndicator(
                        value: 0.98,
                        backgroundColor: Colors
                            .transparent, // Transparent background for rounded corners
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.05), // 5% of screen width as bottom margin
              ],
            ),
          ),
        ),
      ),
    );
  }
}
