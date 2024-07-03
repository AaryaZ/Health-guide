import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:healthguide/screens/otp_screen.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class Login extends StatefulWidget {
  final String name;
  final String location;
  final String language;
  final String gender;
  final int age;
  final String activity;
  final double height;
  final String email;
  Login({
    required this.name,
    required this.location,
    required this.language,
    required this.gender,
    required this.age,
    required this.activity,
    required this.height,
    required this.email,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  // default counrtry select kar rakhi honi chahihiye
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

  Future<void> registerUser() async {
    String apiUrl =
        'https://health-guide-backend.onrender.com/api/auth/register/';

    //  payload
    Map<String, dynamic> body = {
      'name': widget.name,
      'email': widget.email,
      'location': widget.location,
      'language': widget.language,
      'gender': widget.gender,
      'age': widget.age,
      'active_time': widget.activity,
      'height': widget.height,
      'medical_condition': "None",
      'phoneNumber': '+' + selectedCountry.phoneCode + phoneController.text,
    };

    try {
      // Make POST request
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      // Check response
      if (response.statusCode == 200) {
        // Handle success scenario
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpScreen()),
        );
      } else {
        // Handle error scenario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarHG(
            title: "Registration Failed",
            text: "Failed to register. Please try again later.",
          ).show(),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHG(
          title: "Network Error",
          text: "Failed to connect to the server. Please check your network.",
        ).show(),
      );
    }
  }

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
              vertical: GlobalHeight * 0.06, horizontal: GlobalWidth * 0.1),
          child: Column(
            children: [
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
                    'https://lottie.host/692cc967-986c-4e75-b054-afc3f544f2f0/js70zXx5MS.json',
                    repeat: true,
                    fit: BoxFit.contain),
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

              const SizedBox(height: 20),
              TextFormField(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                cursorColor: Colors.blue,
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
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
                  // prefix icon for flag and countrycode
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
                              shape: BoxShape.circle, color: Colors.green),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
              ),
              //button
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: GlobalHeight * 0.07,
                    bottom: GlobalHeight * 0.1,
                    right: GlobalWidth * 0.1,
                    left: GlobalWidth * 0.1),
                child: GestureDetector(
                  onTap: () {
                    if (phoneController.text.length > 9) {
                      registerUser();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
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
      )),
    );
  }
}
