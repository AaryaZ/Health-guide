import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'age.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  Widget genderCard(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        selectGender(gender);
      },
      child: Card(
        color: isSelected ? Color(0xFF10328C) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.025),
        ),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: MediaQuery.of(context).size.width * 0.1,
                color: isSelected ? Colors.white : Color(0xFF10328C),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Text(
                gender,
                style: GoogleFonts.inter(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Color(0xFF10328C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE8EAF0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                  SizedBox(height: screenHeight * 0.02),
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
                    'Your Gender',
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF10328C),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth * 0.05,
                    crossAxisSpacing: screenWidth * 0.05,
                    children: [
                      genderCard('Male', FontAwesomeIcons.mars),
                      genderCard('Female', FontAwesomeIcons.venus),
                      genderCard('Transgender', FontAwesomeIcons.transgender),
                      genderCard('Others', FontAwesomeIcons.ellipsisH),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgeScreen()),
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
                  SizedBox(height: screenWidth * 0.1),
                  Container(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.05),
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
                          value: 0.3, // Adjusted progress value
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
      ),
    );
  }
}
