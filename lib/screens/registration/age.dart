import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'active.dart';

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> ageList =
        List.generate(100, (index) => (index + 1).toString());

    String? selectedAge; // Change selectedAge to be nullable

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_rounded),
                    )),
                // SizedBox(height: screenWidth * 0.15),
                Text(
                  'Tell us more!',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  "We’re happy you're here.",
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.028,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                    height: screenWidth *
                        0.1), // 8% of screen width as vertical spacing
                Text(
                  'Your Age',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth *
                        0.045, // 4.5% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(
                    height:
                        10), // Adjusted height to center the DropdownButtonFormField
                Container(
                  // Container to hold the DropdownButtonFormField with padding and alignment
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.01), // Adjust vertical padding
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    color: Colors
                        .white, // Background color of the dropdown container
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedAge,
                    items: ageList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Change onChanged to accept nullable String
                      selectedAge = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Select Your Age',
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                      border:
                          InputBorder.none, // Remove border around the dropdown
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    ),
                    dropdownColor: Color(
                        0xFFE8EAF0), // Set background color of the dropdown list
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityLevelPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10328C),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.025),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.4,
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
