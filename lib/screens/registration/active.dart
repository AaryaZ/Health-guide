import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'height.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class ActivityLevelPage extends StatefulWidget {
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  ActivityLevelPage({
    required this.name,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
  });
  @override
  _ActivityLevelPageState createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  String _activityLevel = 'None to Little Activity';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
              'How active are you?',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            Text(
              "Tell us your honest answers, help us calculate important stats to help you curate plans.",
              style: GoogleFonts.inter(
                fontSize: screenHeight * 0.017,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            buildRadioOption('None to Little Activity'),
            buildRadioOption('Slightly Active'),
            buildRadioOption('Moderately Active'),
            buildRadioOption('Very Active'),
            Spacer(),
            SizedBox(height: screenHeight * 0.15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeightScreen(
                            name: widget.name,
                            location: widget.location,
                            language: widget.location,
                            gender: widget.gender,
                            age: widget.age,
                            activity: _activityLevel)),
                  );
                  print(widget.name);
                  print(widget.location);
                  print(widget.language);
                  print(widget.gender);
                  print(widget.age);
                  print(_activityLevel);
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
                    value: 0.5,
                    backgroundColor: Colors.transparent,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                  ),
                ),
              ),
            ),
            // SizedBox(height: screenWidth * 0.05),
          ],
        ),
      ),
    );
  }

  Widget buildRadioOption(String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
          groupValue: _activityLevel,
          onChanged: (newValue) {
            setState(() {
              _activityLevel = newValue!;
            });
          },
        ),
      ),
    );
  }
}
