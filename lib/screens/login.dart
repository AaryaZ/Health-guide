import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:healthguide/screens/otp_screen.dart';
import 'package:healthguide/utils/snack_bar.dart';
import 'package:lottie/lottie.dart';

Color dblue = const Color.fromARGB(255, 16, 49, 140);
Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class Login extends StatefulWidget {
  const Login({super.key});

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
              vertical: GlobalHeight * 0.07, horizontal: GlobalWidth * 0.1),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: GlobalHeight * 0.1,
                ),
                child: Lottie.network(
                    'https://lottie.host/b6550c7e-1a07-439e-b1e8-d3786224d2d9/piuulB6mAJ.json',
                    fit: BoxFit.fitWidth,
                    repeat: true),
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
                    (phoneController.text.length > 9)
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()))
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBarHG(title: "Hello", text: "Hello again")
                                .show());
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
