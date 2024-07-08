import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/screens/onboarding.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showFirstSplash = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _startSplashSequence();
  }

  _startSplashSequence() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showFirstSplash = false;
      });
    });
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _showFirstSplash ? Color(0xFF10328C) : Color(0xFFE8EAF0),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _showFirstSplash ? _buildFirstSplash() : _buildSecondSplash(),
        ),
      ),
    );
  }

  Widget _buildFirstSplash() {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 29.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'YourHealthGuide',
              duration: Duration(seconds: 2),
            ),
          ],
          totalRepeatCount: 1,
        ),
      ),
    );
  }

  Widget _buildSecondSplash() {
    return Container(
      key: UniqueKey(), // Ensure AnimatedSwitcher recognizes this as a new widget
      color: Color(0xFFE8EAF0), // Background color of the page
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFF10328C),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Lottie.network(
              'https://lottie.host/5ceb577d-44ec-4d11-a47a-7f28e92be681/xfSxKtfuwG.json',
              width: 300,
              height: 160,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
