import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/pace.dart';
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
            Padding(
              padding: EdgeInsets.only(
                  top: GlobalHeight * 0.07,
                  bottom: GlobalHeight * 0.02,
                  right: GlobalWidth * 0.06,
                  left: GlobalWidth * 0.06),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HeightScreen()));
                },
                child: Container(
                  width: GlobalWidth,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    color: dblue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Next',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
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
