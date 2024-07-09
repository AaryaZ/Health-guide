import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthguide/api_services/set_usertrackers.dart';
import 'package:healthguide/utils/navbar.dart';

class SetTracker extends StatefulWidget {
  const SetTracker({Key? key}) : super(key: key);

  @override
  State<SetTracker> createState() => _SetTrackerState();
}

class _SetTrackerState extends State<SetTracker> {
  List<Tracker> myTrackers = [
    Tracker(title: 'Sleep', imagePath: 'lib/images/medicine.jpg'),
    Tracker(title: 'Medicine', imagePath: 'lib/images/sleep.png'),
    Tracker(title: 'Heart Rate', imagePath: 'lib/images/heartrate.png'),
    Tracker(title: 'Respiratory', imagePath: 'lib/images/respiratory.png'),
    Tracker(title: 'Calories', imagePath: 'lib/images/food.png'),
    Tracker(title: 'Water', imagePath: 'lib/images/water.png'),
    Tracker(title: 'Step Counter', imagePath: 'lib/images/steps.png'),
    Tracker(title: 'Work Out', imagePath: 'lib/images/workout.png'),
    Tracker(title: 'Weight', imagePath: 'lib/images/weight.png'),
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
                    fontSize: 20,
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
                        selectedTrackerTitles.add(tracker.title);
                      } else {
                        selectedTrackerTitles.remove(tracker.title);
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 16, 49, 140),
        foregroundColor: Colors.white,
        onPressed: () {
          sendSelectedTrackers(context, selectedTrackerTitles);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
            (route) => false,
          );
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

class Tracker {
  final String title;
  final String imagePath;
  bool isSelected;

  Tracker({
    required this.title,
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
      title: Text(title),
      trailing:
          isSelected ? Icon(Icons.check_circle, color: Colors.green) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
