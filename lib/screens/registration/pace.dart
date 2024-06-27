import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medical.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class PacePage extends StatefulWidget {
  @override
  _PacePageState createState() => _PacePageState();
}

class _PacePageState extends State<PacePage> {
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
            SizedBox(height: GlobalWidth * 0.01),
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
              'Which pacing suit you the best?',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.02,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: GlobalHeight * 0.01),
            buildRadioOption('0.25 Kg per week'),
            buildRadioOption('0.5 Kg per week'),
            buildRadioOption('0.75 Kg per week'),
            buildRadioOption('1 Kg per week'),
            Spacer(),
            SizedBox(height: GlobalWidth * 0.2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicalConditionsScreen()),
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
                    value: 0.9, // Adjusted progress value
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
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;
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
