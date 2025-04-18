import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthguide/screens/set_tracker.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final storage = FlutterSecureStorage();

Future<void> verifyOTP(
    BuildContext context, String phone, String? otpCode) async {
  String apiUrl =
      'https://health-guide-backend.onrender.com/api/auth/verify-otp/';

  //  payload
  Map<String, dynamic> body = {'phoneNumber': phone, 'otp': otpCode};

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      //Acess token and refresh token stroarge
      var responseBody = jsonDecode(response.body);
      String accessToken = responseBody['accessToken'];
      String refreshToken = responseBody['refreshToken'];
      await storage.write(key: 'accessToken', value: accessToken);
      await storage.write(key: 'refreshToken', value: refreshToken);
      //logged in
      await storage.write(key: 'loggedin', value: 'True');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SetTracker()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHG(
          title: "Verification  Failed",
          text: "Failed to login. Please enter correct OTP.",
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
