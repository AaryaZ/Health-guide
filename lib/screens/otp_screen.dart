import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/registration/name.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

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
              padding: EdgeInsets.symmetric(
                  vertical: GlobalHeight * 0.07,
                  horizontal: GlobalWidth * 0.05),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back_rounded),
                      )),
                  Container(
                    width: GlobalWidth * 0.4,
                    height: GlobalHeight * 0.4,
                    decoration: const BoxDecoration(
                      // backgroundBlendMode: BlendMode.colorDodge,
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(253, 232, 234, 240),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(197, 194, 194, 1),
                            // color: Color(0xFFADBFF0),
                            offset: const Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0)
                      ],
                    ),
                    child: Lottie.network(
                        'https://lottie.host/4c00db94-be91-4210-a927-0156febf2546/M0DFTdMGBm.json',
                        repeat: false),
                  ),
                  // SizedBox(height: GlobalHeight * 0.03),
                  FittedBox(
                    child: Text(
                      "Login via Mobile number",
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 22,
                            color: dblue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: GlobalHeight * 0.02),
                  Text(
                    "Enter the OTP send to your \n phone number",
                    maxLines: 2,
                    style: GoogleFonts.inter(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: GlobalHeight * 0.02),
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // border: Border.all(color: Colors.blueGrey),
                        boxShadow: [
                          BoxShadow(
                              // color: Colors.grey.shade500,
                              color: Colors.grey,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0)
                        ],
                      ),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        otpCode = value;
                        print('otpcode = ${otpCode}');
                      });
                    },
                  ),

                  //Verify buttton
                  Padding(
                    padding: EdgeInsets.only(
                      top: GlobalHeight * 0.3 * 0.2,
                      bottom: GlobalHeight * 0.3 * 0.1,
                      left: GlobalWidth * 0.15,
                      right: GlobalWidth * 0.15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (otpCode != null) {
                          print("invlid otp");
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NameScreen()),
                            (route) => false,
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
        ));
  }
}
