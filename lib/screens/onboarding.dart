import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: [
              //   O1(),
              //   O2(),
              //  O3(),
            ],
          ),
          //bottom
          Container(
            height: GlobalHeight * 0.3,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(60.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: GlobalHeight * 0.3 * 0.15,
                      left: GlobalWidth * 0.1,
                      bottom: GlobalHeight * 0.3 * 0.01),
                  child: FittedBox(
                    child: Text(
                      'Your Health Guide',
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        color: Color.fromARGB(255, 16, 49, 140),
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: GlobalWidth * 0.12),
                  child: FittedBox(
                    child: Text(
                      'Your new ultimate guide',
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                // Button()
              ],
            ),
          )
        ],
      ),
    );
  }
}
