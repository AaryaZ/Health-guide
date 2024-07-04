import 'package:flutter/material.dart';

class WaterReminderScreen extends StatefulWidget {
  @override
  _WaterReminderScreenState createState() => _WaterReminderScreenState();
}

class _WaterReminderScreenState extends State<WaterReminderScreen> {
  bool isReminderOn = true;
  bool remindEvery30Minutes = true;
  bool remind8Times = true;
  String intervalTime = '30 Minutes';
  String timesPerDay = '8 Times';

  Future<void> _changeIntervalTime(BuildContext context) async {
    final String? result = await _showInputDialog(context, 'Change Interval Time', 'Enter new interval time');
    if (result != null && result.isNotEmpty) {
      setState(() {
        intervalTime = result;
      });
    }
  }

  Future<void> _changeTimesPerDay(BuildContext context) async {
    final String? result = await _showInputDialog(context, 'Change Times Per Day', 'Enter new times per day');
    if (result != null && result.isNotEmpty) {
      setState(() {
        timesPerDay = result;
      });
    }
  }

  Future<String?> _showInputDialog(BuildContext context, String title, String hint) async {
    TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hint),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text('OK'),
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
          'Water Reminder',
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
                  Text('Water Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: remindEvery30Minutes,
                              onChanged: (value) {
                                setState(() {
                                  remindEvery30Minutes = value!;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () => _changeIntervalTime(context),
                              child: Text('Remind me every', style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _changeIntervalTime(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 9, 19, 157)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(intervalTime, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 9, 19, 157))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: remind8Times,
                              onChanged: (value) {
                                setState(() {
                                  remind8Times = value!;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () => _changeTimesPerDay(context),
                              child: Text('Remind me', style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _changeTimesPerDay(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 9, 19, 157)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(timesPerDay, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 9, 19, 157))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
