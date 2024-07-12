import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/Home/homeScreen.dart';
import 'package:healthguide/Plan/planScreen.dart';
import 'package:healthguide/Profile/profileScreen.dart';
import 'package:healthguide/screens/login.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PlanScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 9, 19, 157),
        unselectedItemColor: Colors.black38,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 16, 49, 140),
              foregroundColor: Colors.white,
              onPressed: () {
                logOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Login()));
              },
              label: Text("Logout",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
              icon: Icon(Icons.logout_rounded, color: Colors.white),
            )
          : null,
    );
  }
}

Future<void> logOut() async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'loggedin', value: 'False');
}
