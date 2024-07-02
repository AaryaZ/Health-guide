import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/onboarding.dart';
import 'package:lottie/lottie.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/images/splashbg.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.75,
                  child: Lottie.network(
                      'https://lottie.host/e8681eec-3f95-45da-bd31-e80dc70a9740/0RxJAwpmql.json',
                      fit: BoxFit.fill,
                      repeat: true),
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  height: screenWidth * 0.2,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.015,
                        ),
                        child: Text(
                          " Discover",
                          style: GoogleFonts.rubik80sFade(
                            color: Color(0xFF15015D),
                            // color: Color(0xFF15015D),
                            fontSize: screenWidth * 0.09,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      DefaultTextStyle(
                          style: GoogleFonts.luckiestGuy(
                            color: Color(0xFF15015D),
                            // color: Color(0xFFB6FFF8),
                            fontSize: screenWidth * 0.1,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(' STRENGTH',
                                  duration: Duration(seconds: 1)),
                              RotateAnimatedText(' WELLNESS',
                                  duration: Durations.extralong4),
                              RotateAnimatedText('  YOU !!',
                                  duration: Duration(seconds: 1)),
                            ],
                            repeatForever: true,
                            // pause: Duration(milliseconds: 2000),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
