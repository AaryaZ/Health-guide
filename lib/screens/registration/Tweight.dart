import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pace.dart';
import 'package:healthguide/screens/registration/language.dart';


class TWeightScreen extends StatefulWidget {
  @override
  _TWeightScreenState createState() => _TWeightScreenState();
}

class _TWeightScreenState extends State<TWeightScreen> {
  String? selectedKg;
  String? selectedLbs;
  bool isKg = true; // State to manage Kg (true) / Lbs (false) switch

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var GlobalHeight = MediaQuery.of(context).size.height;

    List<String> kgList = List.generate(250, (index) => (index + 1).toString());
    List<String> lbsList =
        List.generate(500, (index) => (index + 1).toString());


    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(

        padding: EdgeInsets.symmetric(
            vertical: GlobalHeight * 0.07, horizontal: screenWidth * 0.05),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_rounded),
                    )),
                // SizedBox(height: screenWidth * 0.15),

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
                  'Your Target Weight',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: 10),
                if (isKg) ...[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      color: Colors.white,
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedKg,
                      items: kgList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedKg = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Your Weight (kg)',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),

                      ),
                      dropdownColor: Color(0xFFE8EAF0),
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      color: Colors.white,
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedLbs,
                      items: lbsList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedLbs = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Your Weight (lbs)',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),

                      ),
                      dropdownColor: Color(0xFFE8EAF0),
                    ),
                  ),
                ],
                SizedBox(height: screenWidth * 0.05),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),

                  transitionBuilder: (Widget child, Animation<double> animation) {

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

                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),

                          child: Text(
                            isKg ? 'Kg' : 'Lbs',
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

                          inactiveTrackColor: Color(0xFF10328C).withOpacity(0.5),

                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PacePage()),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10328C),
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),


                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(

                        value: 0.6,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),

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
