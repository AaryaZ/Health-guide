import 'package:flutter/material.dart';

class FoodReminderScreen extends StatefulWidget {
  @override
  _FoodReminderScreenState createState() => _FoodReminderScreenState();
}

class _FoodReminderScreenState extends State<FoodReminderScreen> {
  bool isReminderOn = true;
  Map<String, bool> foodReminder = {
    'Breakfast': true,
    'Lunch': true,
    'Snacks': true,
    'Dinner': true,
  };

  Map<String, String> reminderTimes = {
    'Breakfast': '9:30 AM',
    'Lunch': '1:30 PM',
    'Snacks': '6:00 PM',
    'Dinner': '9:30 PM',
  };

  Future<void> _selectTime(BuildContext context, String meal) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        reminderTimes[meal] = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Reminders',
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
                  Text('Track Food Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  children: foodReminder.keys.map((meal) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: foodReminder[meal],
                                onChanged: (value) {
                                  setState(() {
                                    foodReminder[meal] = value!;
                                  });
                                },
                              ),
                              Text(meal, style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () => _selectTime(context, meal),
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
                              reminderTimes[meal]!,
                              style: TextStyle(color: Color.fromARGB(255, 9, 19, 157)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
