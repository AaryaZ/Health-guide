import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:healthguide/api_services/checkphone.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  bool _isLoading = false;

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    var GlobalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgblue,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: GlobalHeight * 0.06,
                    horizontal: GlobalWidth * 0.1),
                child: Column(
                  children: [
                    Container(
                      width: GlobalWidth * 0.4,
                      height: GlobalHeight * 0.4,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(253, 232, 234, 240),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(197, 194, 194, 1),
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
                      child: Lottie.asset("assets/anims/login_profile.json",
                          repeat: true, fit: BoxFit.contain),
                    ),
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
                    const SizedBox(height: 20),
                    TextFormField(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      cursorColor: Colors.blue,
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Enter mobile number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 97, 182, 251)),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 10.0),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: CountryListThemeData(
                                    bottomSheetHeight: 500,
                                  ),
                                  onSelect: (value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  });
                            },
                            child: Text(
                              "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        suffixIcon: phoneController.text.length > 9
                            ? Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                          top: GlobalHeight * 0.07,
                          bottom: GlobalHeight * 0.1,
                          right: GlobalWidth * 0.1,
                          left: GlobalWidth * 0.1),
                      child: GestureDetector(
                        onTap: () async {
                          if (phoneController.text.length > 9) {
                            setState(() {
                              _isLoading = true;
                            });
                            String phoneNumber = '+' +
                                selectedCountry.phoneCode +
                                phoneController.text;
                            print(phoneNumber);
                            await checkPhoneNumber(context, phoneNumber);
                            setState(() {
                              _isLoading = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBarHG(
                                    title: "Something went wrong!",
                                    text:
                                        "Please enter a Valid 10-digit phone number.")
                                .show());
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
                            'Login',
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
          if (_isLoading)
            Center(
              child: Container(
                width: GlobalWidth,
                height: GlobalHeight,
                color: bgblue.withOpacity(0.2),
                child: Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: GlobalWidth * 0.5,
                      height: GlobalHeight,
                      child: Lottie.asset("assets/anims/loading.json",
                          repeat: true, fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
