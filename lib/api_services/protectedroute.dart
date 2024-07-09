import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:healthguide/utils/snack_bar.dart';

Future<void> sendSelectedTrackers(
    BuildContext context, List<String> selectedTrackers) async {
  String apiUrl = 'https://health-guide-backend.onrender.com/api/set-trackers/';

  final storage = FlutterSecureStorage();
  String? aT = await storage.read(key: 'accessToken');
  //  payload
  List<String> allTrackers = [
    "sleep",
    "medicine",
    "heartRate",
    "respiratory",
    "calories",
    "water",
    "stepCounter",
    "workout",
    "weight"
  ];

  List<Map<String, dynamic>> data = allTrackers.map((tracker) {
    return {"key": tracker, "value": selectedTrackers.contains(tracker)};
  }).toList();

  // Prepare the body
  Map<String, dynamic> body = {
    'data': data,
  };

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Authorization': 'Token ${aT}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      String message = responseBody['msg'];
      print("${message}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHG(
          title: "Oops!Something went wrong.",
          text: "Try logging in again. Please try again later.",
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

Future<void> protectedRoute(BuildContext context) async {
  final storage = FlutterSecureStorage();
  String? aT = await storage.read(key: 'accessToken');

  final url =
      Uri.parse('https://health-guide-backend.onrender.com/api/protected/');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Token $aT',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      String message = responseBody['msg'];
      String username = message.split(':').last.trim();
      print("${username}");
      await storage.write(key: 'userName', value: username);
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
        title: "Authentication Failure",
        text: "Failed to connect to the server. Please check your network.",
      ).show(),
    );
  }
}
