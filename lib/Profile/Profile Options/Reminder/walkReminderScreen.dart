import 'package:flutter/material.dart';

class WalkReminderScreen extends StatefulWidget {
  @override
  _WalkReminderScreenState createState() => _WalkReminderScreenState();
}

class _WalkReminderScreenState extends State<WalkReminderScreen> {
  bool isReminderOn = true;
  Map<String, bool> WalkReminder = {
    'Remind me at': true,
  };

  Map<String, String> reminderTimes = {
    'Remind me at': '9:30 AM',
  };

  Future<void> _selectTime(BuildContext context, String Walk) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        reminderTimes[Walk] = picked.format(context);
      });
    }
  }

  void _addWalkReminder() {
    String WalkName = '';
    String reminderTime = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Walk'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Walk Name'),
                  onChanged: (value) {
                    WalkName = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Reminder Time'),
                  readOnly: true,
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        reminderTime = picked.format(context);
                      });
                    }
                  },
                  controller: TextEditingController(text: reminderTime),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (WalkName.isNotEmpty && reminderTime.isNotEmpty) {
                  setState(() {
                    WalkReminder[WalkName] = true;
                    reminderTimes[WalkName] = reminderTime;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Walk Reminders',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19, 157),
      ),
      body: Card(
        margin: EdgeInsets.all(20),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Track Walk Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Switch(
                    value: isReminderOn,
                    onChanged: (value) {
                      setState(() {
                        isReminderOn = value;
                      });
                    },
                  ),
                ],
              ),
              if (isReminderOn)
                Column(
                  children: WalkReminder.keys.map((Walk) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: WalkReminder[Walk],
                            onChanged: (value) {
                              setState(() {
                                WalkReminder[Walk] = value!;
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () => _selectTime(context, Walk),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color.fromARGB(255, 9, 19, 157), backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Color.fromARGB(255, 9, 19, 157)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            child: Text(
                              reminderTimes[Walk]!,
                              style: TextStyle(color: Color.fromARGB(255, 9, 19, 157)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addWalkReminder,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Add Walk',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color.fromARGB(255, 9, 19, 157),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
