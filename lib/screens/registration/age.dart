import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'active.dart';

class AgeScreen extends StatefulWidget {
  final String phone;
  final String name;
  final String location;
  final String language;
  final String gender;

  AgeScreen(
      {required this.phone,
      required this.name,
      required this.location,
      required this.language,
      required this.gender});
  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> ageList =
        List.generate(100, (index) => (index + 1).toString());

    String? selectedAge; // Change selectedAge to be nullable

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.04, horizontal: screenWidth * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_rounded),
                    )),

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
                SizedBox(height: screenWidth * 0.1),
                Text(
                  'Your Age',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth *
                        0.045, // 4.5% of screen width as font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
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
                SizedBox(
                    height: screenHeight *
                        0.48), // 8% of screen width as vertical spacing
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      int age = 0;
                      if (selectedAge == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBarHG(
                                title: "Oops!", text: "Mention your age.")
                            .show());
                      } else {
                        age = int.parse(selectedAge!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityLevelPage(
                                    phone: widget.phone,
                                    name: widget.name,
                                    location: widget.location,
                                    language: widget.language,
                                    gender: widget.gender,
                                    age: age,
                                  )),
                        );
                      }
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
                        value: 0.4,
                        backgroundColor: Colors
                            .transparent, // Transparent background for rounded corners
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
