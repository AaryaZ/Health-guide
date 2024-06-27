import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gender.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class LanguagePreferenceScreen extends StatefulWidget {
  @override
  _LanguagePreferenceScreenState createState() =>
      _LanguagePreferenceScreenState();
}

class _LanguagePreferenceScreenState extends State<LanguagePreferenceScreen> {
  List<String> languages = [
    'English',
    'Hindi',
    'Marathi',
    'Malayalam',
    'Gujarati',
    'Kannada',
    'Punjabi',
    'Bengali',
    'Tamil',
    'Others'
  ];
  List<bool> selected = List.filled(10, false);
  int selectedCount = 0;
  final int maxSelections = 1;

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
              'Tell us more!',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.03,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: GlobalWidth * 0.007),
            Text(
              "We’re happy you're here.",
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.015,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: GlobalHeight * 0.06),
            Text(
              maxLines: 2,
              'What is your language \npreference?',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.02,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            // SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          selected[index] ? Colors.white : Colors.black,
                      backgroundColor: selected[index] ? dblue : Colors.white,
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: selected[index] ? 10 : 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selected[index]) {
                          selected[index] = false;
                          selectedCount = 0;
                        } else if (selectedCount == 1) {
                        } else {
                          selected[index] = true;
                          selectedCount = 1;
                        }
                      });
                    },
                    child: Text(languages[index]),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenderScreen()),
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
                    value: 0.2, // Adjusted progress value
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
}
