import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/api_services/protectedroute.dart';
import 'package:healthguide/utils/navbar.dart';

class SetTracker extends StatefulWidget {
  const SetTracker({Key? key}) : super(key: key);

  @override
  State<SetTracker> createState() => _SetTrackerState();
}

class _SetTrackerState extends State<SetTracker> {
  List<Tracker> myTrackers = [
    Tracker(
        title: 'Sleep', tname: 'sleep', imagePath: 'lib/images/medicine.jpg'),
    Tracker(
        title: 'Medicine',
        tname: 'medicine',
        imagePath: 'lib/images/sleep.png'),
    Tracker(
        title: 'Heart Rate',
        tname: 'heartRate',
        imagePath: 'lib/images/heartrate.png'),
    Tracker(
        title: 'Respiratory',
        tname: 'respiratory',
        imagePath: 'lib/images/respiratory.png'),
    Tracker(
        title: 'Calories', tname: 'calories', imagePath: 'lib/images/food.png'),
    Tracker(title: 'Water', tname: 'water', imagePath: 'lib/images/water.png'),
    Tracker(
        title: 'Step Counter',
        tname: 'stepCounter',
        imagePath: 'lib/images/steps.png'),
    Tracker(
        title: 'Work Out',
        tname: 'workOut',
        imagePath: 'lib/images/workout.png'),
    Tracker(
        title: 'Weight', tname: 'weight', imagePath: 'lib/images/weight.png'),
  ];

  List<String> selectedTrackerTitles = [];
  List<String> allTrackerTitles = [
    'sleep',
    'weight',
    'workOut',
    'stepCounter',
    'water',
    'calories',
    'respiratory',
    'heartRate',
    'medicine'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFBDEE4F7),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 16, 49, 140),
            floating: true,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                'lib/images/Wellbeing.jpg',
                fit: BoxFit.fitWidth,
              ),
              title: Text(
                ' HEALTH GUIDE',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Container(
                child: Text(
                  textAlign: TextAlign.center,
                  'What brings you here?',
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 16, 49, 140),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final tracker = myTrackers[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tracker.isSelected = !tracker.isSelected;
                      if (tracker.isSelected) {
                        selectedTrackerTitles.add(tracker.tname);
                      } else {
                        selectedTrackerTitles.remove(tracker.tname);
                      }
                    });
                  },
                  child: customListTile(
                    tracker.imagePath,
                    tracker.title,
                    tracker.isSelected,
                  ),
                );
              },
              childCount: myTrackers.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          )
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              heroTag: 'Nexttag',
              backgroundColor: const Color.fromARGB(255, 16, 49, 140),
              foregroundColor: Colors.white,
              elevation: 30,
              label: Text("Next"),
              icon: Icon(Icons.send_rounded),
              onPressed: () {
                sendSelectedTrackers(context, selectedTrackerTitles);
                protectedRoute(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNav()),
                  (route) => false,
                );
              },
              // child: Icon(Icons.send_rounded),
            ),
          ),
          Positioned(
            bottom: 70.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              heroTag: 'skipTag',
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 16, 49, 140),
              elevation: 30,
              label: Text("Skip"),
              icon: Icon(Icons.thumb_down_alt_rounded),
              onPressed: () {
                sendSelectedTrackers(context, allTrackerTitles);
                protectedRoute(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNav()),
                  (route) => false,
                );
              },
              // child: Icon(Icons.skip_next),
            ),
          ),
        ],
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      //skip button
    );
  }
}

class Tracker {
  final String title;
  final String tname;
  final String imagePath;
  bool isSelected;

  Tracker({
    required this.title,
    required this.tname,
    required this.imagePath,
    this.isSelected = false,
  });
}

Widget customListTile(
  String imagePath,
  String title,
  bool isSelected,
) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: ListTile(
      tileColor: isSelected ? Color(0xFFF3F5F6) : Colors.white54,
      minTileHeight: 80,
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: const Color.fromARGB(255, 16, 49, 140),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.check_circle_outline, color: Colors.blueGrey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
