import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/api_services/verify_otp.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class OtpScreen extends StatefulWidget {
  final String phone;
  OtpScreen({required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgblue,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: GlobalHeight * 0.06, horizontal: GlobalWidth * 0.05),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Lottie.asset(
                      'assets/animation/back.json',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Container(
                  width: GlobalWidth * 0.4,
                  height: GlobalHeight * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(253, 232, 234, 240),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(197, 194, 194, 1),
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Lottie.network(
                    'https://lottie.host/4c00db94-be91-4210-a927-0156febf2546/M0DFTdMGBm.json',
                    repeat: false,
                  ),
                ),
                FittedBox(
                  child: Text(
                    "Login via Mobile number",
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      color: dblue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: GlobalHeight * 0.02),
                Text(
                  "Enter the OTP sent to your phone number",
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: GlobalHeight * 0.02),
                Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onChanged: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: GlobalHeight * 0.2,
                    bottom: GlobalHeight * 0.1,
                    left: GlobalWidth * 0.15,
                    right: GlobalWidth * 0.15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (otpCode != null && otpCode!.length == 4) {
                        verifyOTP(context, widget.phone, otpCode);
                        // Save login status
                        saveLoginStatus();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarHG(
                            title: "Oops!",
                            text: "Invalid OTP. Please check and try again.",
                          ).show(),
                        );
                      }
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
                        'Verify',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
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
        ),
      ),
    );
  }

  // Function to save login status using shared preferences
  Future<void> saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
}
