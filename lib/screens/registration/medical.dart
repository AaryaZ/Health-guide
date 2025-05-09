import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/email.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class MedicalConditionsScreen extends StatefulWidget {
  final String phone;
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  final double height;
  MedicalConditionsScreen({
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
              'Any Medication conditions we need to be aware of?',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Color(0xFF10328C),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 2,
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
                          fontSize: 13,
                          // fontWeight: FontWeight.w500,
                          color: selected[index] ? dblue : Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        softWrap: true,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //selected medical conditions cncatenated ina single string
                  String selectedConditions = conditions
                      .asMap()
                      .entries
                      .where((entry) => selected[entry.key])
                      .map((entry) => entry.value)
                      .join(', ');

                  if (selectedConditions.isEmpty) {
                    selectedConditions = "None";
                  }

                  //------------------------------
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Email(
                              phone: widget.phone,
                              name: widget.name,
                              location: widget.location,
                              language: widget.language,
                              gender: widget.gender,
                              age: widget.age,
                              activity: widget.activity,
                              height: widget.height,
                              medicalcondition: selectedConditions,
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
                    value: 0.96,
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
}
