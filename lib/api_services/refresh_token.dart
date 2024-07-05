import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> refreshTokenApi(BuildContext context) async {
  String apiUrl =
      'https://health-guide-backend.onrender.com/api/auth/refresh-token/';

  //acesss token to be passed
  final storage = FlutterSecureStorage();
  String? rT = await storage.read(key: 'refreshToken');

  if (rT == null) {
    print("nhi hua refreshToken");
  } else {
    Map<String, dynamic> body = {'token': rT};

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

        await storage.write(key: 'accessToken', value: accessToken);

        //------testing actual storage of tokens-----------
        String? aT = await storage.read(key: 'accessToken');

        if (aT == null) {
          print("new nhi hua accessToken");
        } else {
          print("ho gya");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarHG(
            title: "Verification  Failed",
            text: "Please enter your phone number again.",
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
}

Future<Map<String, dynamic>> protectedRoute(BuildContext context) async {
  final storage = FlutterSecureStorage();
  String? aT = await storage.read(key: 'accessToken');

  final url =
      Uri.parse('https://health-guide-backend.onrender.com/api/protected/');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Token $aT',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarHG(
        title: "Verification  Failed",
        text: "Please enter your phone number again.",
      ).show(),
    );
    print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception('Authentication Failure');
  }
}
