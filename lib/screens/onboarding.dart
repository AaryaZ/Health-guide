import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/oscreens/o1.dart';
import 'package:healthguide/oscreens/o2.dart';
import 'package:healthguide/oscreens/o3.dart';
import 'package:healthguide/screens/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Color dblue = Color.fromARGB(255, 16, 49, 140);
Color bgblue = Color.fromARGB(253, 232, 234, 240);

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();

  //if on last page
  bool onLastPage = false;
  String T1 = "Your Health Guide";
  String T2 = "Your new ultimate guide";
  String T3 = "Next";

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                T1 = (index == 2)
                    ? "Pull Your Strengths"
                    : (index == 1)
                        ? "Push Your Limits"
                        : "Your Health Guide";
                T2 = (index == 2)
                    ? "Achieve Your Goals"
                    : (index == 1)
                        ? "Reach New Goals"
                        : "Your new ultimate guide";
                T3 = (index == 2) ? "Get Started" : "Next";
              });
            },
            children: [O1(), O2(), O3()],
          ),
          //bottom
          Container(
              alignment: Alignment(0, -0.8),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SwapEffect(
                  activeDotColor: dblue,
                  dotColor: Colors.white,
                  dotHeight: 15,
                  dotWidth: 20,
                ),
              )),
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
                      T1,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        color: dblue,
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
                      T2,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: GlobalHeight * 0.3 * 0.2,
                    bottom: GlobalHeight * 0.3 * 0.1,
                    left: GlobalWidth * 0.15,
                    right: GlobalWidth * 0.15,
                  ),
                  child: GestureDetector(
                    //if on last page
                    // onLastPage?
                    onTap: () {
                      onLastPage
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                              (route) => false,
                            )
                          : _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
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
                        T3,
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
          )
        ],
      ),
    );
  }
}

void onTapButton() {}
