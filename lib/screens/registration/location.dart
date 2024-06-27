import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'gender.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController locationController = TextEditingController();
  String currentLocationName = '';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if not granted
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly
        return;
      }
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    // Perform reverse geocoding
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Extract location name from placemark
      Placemark placemark = placemarks[0]; // Most accurate result
      String locationName = placemark.name ?? placemark.thoroughfare ?? '';

      setState(() {
        currentLocationName = locationName;
        locationController.text = currentLocationName;
      });
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE8EAF0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 0.15),
                Text(
                  'Tell us more!',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  "We’re happy you're here.",
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.028,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenWidth * 0.1),
                Text(
                  'Your Location',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10328C),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Location',
                    hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      borderSide: BorderSide(color: Color(0xFF10328C)),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenderScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10328C),
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.025),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.5),
                Container(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenWidth * 0.015,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.2,
                        backgroundColor: Colors.transparent,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF10328C)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
