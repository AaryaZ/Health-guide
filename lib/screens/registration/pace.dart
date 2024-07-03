import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medical.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class PacePage extends StatefulWidget {
  final String phone;
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  final double height;
  PacePage({
    required this.phone,
    required this.name,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
    required this.activity,
    required this.height,
  });
  @override
  _PacePageState createState() => _PacePageState();
}

class _PacePageState extends State<PacePage> {
  String? _paceLevel = '0.25 Kg per week';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgblue,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.04, horizontal: screenWidth * 0.05),
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
              'You’re Almost there!',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: screenWidth * 0.01),
            Text(
              "We're so happy to have you here.",
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.028,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenWidth * 0.1),
            Text(
              maxLines: 2,
              'Which pacing suit you the best?',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            buildRadioOption('0.25 Kg per week'),
            buildRadioOption('0.5 Kg per week'),
            buildRadioOption('0.75 Kg per week'),
            buildRadioOption('1 Kg per week'),
            Spacer(),
            SizedBox(height: screenHeight * 0.22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicalConditionsScreen(
                              phone: widget.phone,
                              name: widget.name,
                              location: widget.location,
                              language: widget.language,
                              gender: widget.gender,
                              age: widget.age,
                              activity: widget.activity,
                              height: widget.height,
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
                    fontSize:
                        screenWidth * 0.04, // 4.5% of screen width as font size
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
                    value: 0.9,
                    backgroundColor: Colors.transparent,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioOption(String value) {
    var GlobalHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: GlobalHeight * 0.006),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        trailing: Radio<String>(
          value: value,
          groupValue: _paceLevel,
          onChanged: (newValue) {
            setState(() {
              _paceLevel = newValue;
            });
          },
        ),
      ),
    );
  }
}
