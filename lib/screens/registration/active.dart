import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'height.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class ActivityLevelPage extends StatefulWidget {
  @override
  _ActivityLevelPageState createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  String? _activityLevel = 'None to Little Activity';

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgblue,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: GlobalHeight * 0.07, horizontal: GlobalWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_rounded),
                )),
            Text(
              'You’re Almost there!',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.03,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: GlobalWidth * 0.007),
            Text(
              "We're so happy to have you here.",
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.017,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: GlobalHeight * 0.06),
            Text(
              maxLines: 2,
              'How active are you?',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.02,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            Text(
              "Tell us your honest answers, help us calculate important stats to help you curate plans.",
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.017,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: GlobalHeight * 0.02),
            buildRadioOption('None to Little Activity'),
            buildRadioOption('Slightly Active'),
            buildRadioOption('Moderately Active'),
            buildRadioOption('Very Active'),
            Spacer(),
            SizedBox(height: GlobalWidth * 0.2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HeightScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF10328C),
                  padding: EdgeInsets.symmetric(vertical: GlobalWidth * 0.04),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(GlobalWidth * 0.025),
                  ),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.inter(
                    fontSize: GlobalWidth * 0.04,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: GlobalWidth * 0.1),
            Container(
              padding: EdgeInsets.only(bottom: GlobalWidth * 0.05),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: GlobalWidth * 0.015,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.5, // Adjusted progress value
                    backgroundColor: Colors.transparent,

                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                  ),
                ),
              ),
            ),
            SizedBox(height: GlobalWidth * 0.05),
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
              _activityLevel = newValue;
            });
          },
        ),
      ),
    );
  }
}
