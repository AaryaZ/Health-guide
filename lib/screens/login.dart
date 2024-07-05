import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:healthguide/screens/otp_screen.dart';
import 'package:healthguide/screens/registration/name.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
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

  Future<void> checkPhoneNumber() async {
    String apiUrl = 'https://health-guide-backend.onrender.com/api/auth/check-phone-number/';

    Map<String, dynamic> body = {
      'phoneNumber': '+' + selectedCountry.phoneCode + phoneController.text,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        String message = responseBody['msg'];

        if (message == "Phone number does not exist. Continue to register") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NameScreen(
                phone: body['phoneNumber'],
              ),
            ),
          );
        } else {
          // Save login status
          saveLoginStatus();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                phone: body['phoneNumber'],
              ),
            ),
          );
        }
      } else {
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

  // Function to save login status using shared preferences
  Future<void> saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
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
            padding: EdgeInsets.symmetric(vertical: GlobalHeight * 0.06, horizontal: GlobalWidth * 0.1),
            child: Column(
              children: [
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
                    'https://lottie.host/692cc967-986c-4e75-b054-afc3f544f2f0/js70zXx5MS.json',
                    repeat: true,
                    fit: BoxFit.contain,
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
                      borderSide: const BorderSide(color: Color.fromARGB(255, 97, 182, 251)),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
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
                            },
                          );
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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
                              color: Colors.green,
                            ),
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
                    left: GlobalWidth * 0.1,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (phoneController.text.length > 9) {
                        String phoneNumber =
                            '+' + selectedCountry.phoneCode + phoneController.text;
                        print(phoneNumber);
                        checkPhoneNumber();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarHG(
                            title: "Something went wrong!",
                            text: "Please enter a valid 10-digit phone number.",
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
    );
  }
}
