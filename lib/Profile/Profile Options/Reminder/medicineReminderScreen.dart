import 'package:flutter/material.dart';

class MedicineReminderScreen extends StatefulWidget {
  @override
  _MedicineReminderScreenState createState() => _MedicineReminderScreenState();
}

class _MedicineReminderScreenState extends State<MedicineReminderScreen> {
  bool isReminderOn = true;
  Map<String, bool> medicineReminder = {
    'Abarelix': true,
  };

  Map<String, String> reminderTimes = {
    'Abarelix': '9:30 AM',
  };

  Map<String, String> numberOfTablets = {
    'Abarelix': '1 tablet',
  };

  Future<void> _selectTime(BuildContext context, String medicine) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        reminderTimes[medicine] = picked.format(context);
      });
    }
  }

  void _addMedicineReminder() {
    String medicineName = '';
    String numberOfTabs = '';
    String reminderTime = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Medicine Name'),
                  onChanged: (value) {
                    medicineName = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Number of Tablets'),
                  onChanged: (value) {
                    numberOfTabs = value;
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
                if (medicineName.isNotEmpty && numberOfTabs.isNotEmpty && reminderTime.isNotEmpty) {
                  setState(() {
                    medicineReminder[medicineName] = true;
                    reminderTimes[medicineName] = reminderTime;
                    numberOfTablets[medicineName] = numberOfTabs;
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
          'Medicine Reminders',
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
                  Text('Track Medicine Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  children: medicineReminder.keys.map((medicine) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: medicineReminder[medicine],
                                onChanged: (value) {
                                  setState(() {
                                    medicineReminder[medicine] = value!;
                                  });
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(medicine, style: TextStyle(fontSize: 16)),
                                  Text(numberOfTablets[medicine]!, style: TextStyle(fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () => _selectTime(context, medicine),
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
                              reminderTimes[medicine]!,
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
                onPressed: _addMedicineReminder,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Add Medicine',
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

void main() => runApp(MaterialApp(home: MedicineReminderScreen()));
