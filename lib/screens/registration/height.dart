import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'cweight.dart';

class HeightScreen extends StatefulWidget {
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  HeightScreen({
    required this.name,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
    required this.activity,
  });
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  String? selectedFeet;
  String? selectedInches;
  String? selectedCm;
  double selectedHeight = 0;
  bool isKg = true; // State to manage Ft/inch (true) / cm (false) switch

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> feetList = List.generate(8, (index) => (index + 1).toString());
    List<String> inchesList = List.generate(12, (index) => index.toString());
    List<String> cmList =
        List.generate(241, (index) => (index + 60).toString());

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.04, horizontal: screenWidth * 0.05),
        child: Center(
          child: SingleChildScrollView(
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
                  'Your Height',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                if (isKg) ...[
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.01),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.025),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedFeet,
                            items: feetList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedFeet = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Feet',
                              hintStyle:
                                  TextStyle(fontSize: screenWidth * 0.04),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                            ),
                            dropdownColor: Color(0xFFE8EAF0),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.01),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.025),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedInches,
                            items: inchesList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedInches = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Inches',
                              hintStyle:
                                  TextStyle(fontSize: screenWidth * 0.04),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                            ),
                            dropdownColor: Color(0xFFE8EAF0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      color: Colors.white,
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedCm,
                      items: cmList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCm = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Your Height (cm)',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04),
                      ),
                      dropdownColor: Color(0xFFE8EAF0),
                    ),
                  ),
                ],
                SizedBox(height: screenWidth * 0.05),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset(0, 0),
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: Container(
                    key: ValueKey<bool>(isKg),
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),
                          child: Text(
                            isKg ? 'Ft/inch' : 'cms',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Switch(
                          value: isKg,
                          onChanged: (bool value) {
                            setState(() {
                              isKg = value;
                            });
                          },
                          activeColor: Color(0xFF10328C),
                          inactiveThumbColor: Color(0xFF10328C),
                          inactiveTrackColor:
                              Color(0xFF10328C).withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.39),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isKg) {
                        print("Feet${selectedFeet}");
                        print("Inches${selectedInches}");
                      } else {
                        print("Inches${selectedInches}");
                      }
                      if (isKg) {
                        if (selectedFeet == null || selectedInches == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBarHG(
                                  title: "Oops!",
                                  text: "Mention Feet and Inches.")
                              .show());
                        } else {
                          selectedHeight = 2.54 *
                              (int.parse(selectedFeet!) * 12 +
                                  int.parse(selectedInches!));
                          print(selectedHeight);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CWeightScreen(
                                      name: widget.name,
                                      location: widget.location,
                                      language: widget.language,
                                      gender: widget.gender,
                                      age: widget.age,
                                      activity: widget.activity,
                                      height: selectedHeight,
                                    )),
                          );
                        }
                      } else {
                        if (selectedCm == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBarHG(
                                  title: "Oops!",
                                  text: "Mention your height in cm.")
                              .show());
                        } else {
                          selectedHeight = double.parse(selectedCm!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CWeightScreen(
                                      name: widget.name,
                                      location: widget.location,
                                      language: widget.language,
                                      gender: widget.gender,
                                      age: widget.age,
                                      activity: widget.activity,
                                      height: selectedHeight,
                                    )),
                          );
                        }
                      }
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
                        fontSize: screenWidth *
                            0.04, // 4.5% of screen width as font size
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
                        value: 0.6,
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
    );
  }
}
