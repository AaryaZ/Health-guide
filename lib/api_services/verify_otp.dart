import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthguide/utils/navbar.dart';
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
      //------testing actual storage of tokens-----------
      String? aT = await storage.read(key: 'accessToken');
      String? rT = await storage.read(key: 'refreshToken');
      if (aT == null) {
        print("nhi hua accessToken");
      } else {
        print("ho gya");
      }
      if (rT == null) {
        print("nhi hua refreshToken");
      } else {
        print("ho gya refrsh");
      }

      //------------------------------------------------

      print("Otp verified successsfullyyyyy");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHG(
          title: "Verification  Failed",
          text: "Failed to login. Please try again later.",
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
