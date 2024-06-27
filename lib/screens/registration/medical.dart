import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                          fontSize: 14,
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
            SizedBox(height: GlobalWidth * 0.2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PermissionScreen()),
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
                  color: Colors.grey.shade500,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.95, // Adjusted progress value
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
