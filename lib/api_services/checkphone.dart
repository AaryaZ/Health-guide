import 'dart:convert';
import 'package:healthguide/screens/otp_screen.dart';
import 'package:healthguide/screens/registration/name.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:healthguide/utils/snack_bar.dart';

Future<void> checkPhoneNumber(BuildContext context, String phone) async {
  String apiUrl =
      'https://health-guide-backend.onrender.com/api/auth/check-phone-number/';

  //  payload
  Map<String, dynamic> body = {
    'phoneNumber': phone,
  };

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    // Check response
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      String message = responseBody['msg'];
      print(body['phoneNumber']);

      if (message == "Phone number does not exist. Continue to register") {
        print("New phone number");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NameScreen(
              phone: body['phoneNumber'],
            ),
          ),
        );
      } else {
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
