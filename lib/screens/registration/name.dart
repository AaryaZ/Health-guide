import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/age.dart';
import 'location.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(
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
                  'Your Name',
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
                  decoration: InputDecoration(
                    hintText: 'Enter Your Full Name',
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
                    height: screenWidth *
                        0.5), // 8% of screen width as vertical spacing
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to LocationScreen.dart on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationScreen()),
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
                    height: screenWidth *
                        0.5), // 5% of screen width as vertical spacing
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015, // Increase height by 2 pixels
                    width: double.infinity, // Take full width of the screen
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded border radius
                      color: Colors.grey.shade300, // Background color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Clip content to rounded borders
                      child: LinearProgressIndicator(
                        value: 0.1,
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
