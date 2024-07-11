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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(253, 232, 234, 240),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 16, 49, 140),
            floating: true,
            pinned: true,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 16, 49, 140),
        foregroundColor: Colors.white,
        elevation: 30,
        // label: Text("Next"),
        // icon: Icon(Icons.send_rounded),
        onPressed: () {
          sendSelectedTrackers(context, selectedTrackerTitles);
          protectedRoute(context);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
            (route) => false,
          );
        },
        child: Icon(Icons.send_rounded),
        // child: Row(children: [Text("Next"), Icon(Icons.send_rounded)]),
      ),
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
      tileColor: isSelected ? Colors.white38 : Colors.white70,
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
      trailing:
          isSelected ? Icon(Icons.check_circle, color: Colors.green) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
