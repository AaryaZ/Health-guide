import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/active.dart';
import 'permissions.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class MedicalConditionsScreen extends StatefulWidget {
  @override
  _MedicalConditionsScreenState createState() =>
      _MedicalConditionsScreenState();
}

class _MedicalConditionsScreenState extends State<MedicalConditionsScreen> {
  List<String> conditions = [
    // 'None',
    'Diabetes',
    'Thyroid',
    'Physical Injury',
    'PCOS',
    'Anger Issues',
    'Insomnia',
    'Depression',
    'Cholesterol',
    'Others'
  ];
  List<bool> selected = List.filled(10, false);
  int selectedCount = 0;

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
            SizedBox(height: GlobalWidth * 0.005),
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
              'Any Medication conditions we need to be aware of?',
              style: GoogleFonts.inter(
                fontSize: GlobalHeight * 0.02,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            SizedBox(height: 0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: conditions.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                          color: selected[index] ? dblue : Colors.white,
                          width: 1),
                    ),
                    elevation: selected[index] ? 5 : 2,
                    shadowColor: Colors.black.withOpacity(0.2),
                    child: CheckboxListTile(
                      title: Text(
                        conditions[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: selected[index] ? dblue : Colors.black,
                        ),
                      ),
                      value: selected[index],
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selected[index] = true;
                          } else if (value == false) {
                            selected[index] = false;
                          }
                        });
                      },
                      activeColor: dblue,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: GlobalHeight * 0.07,
                  bottom: GlobalHeight * 0.02,
                  right: GlobalWidth * 0.06,
                  left: GlobalWidth * 0.06),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PermissionScreen()));
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
            // SizedBox(height: 16),
            // LinearProgressIndicator(
            //   value: 0.8, // Adjust this value as needed
            //   backgroundColor: Colors.grey[300],
            //   color: dblue,
            //   minHeight: 6,
            // ),
          ],
        ),
      ),
    );
  }
}
