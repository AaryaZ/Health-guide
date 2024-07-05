import 'package:flutter/material.dart';

class UnitsMeasurementsScreen extends StatefulWidget {
  @override
  _UnitsMeasurementsScreenState createState() => _UnitsMeasurementsScreenState();
}

class _UnitsMeasurementsScreenState extends State<UnitsMeasurementsScreen> {
  String selectedWeightUnit = 'Kilograms (Kg)';
  String selectedHeightUnit = 'Centimeters (cms)';
  String selectedDistanceUnit = 'Kilometers (km)';
  String selectedVolumeUnit = 'Millilitres (ml)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Units & Measurement',
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
      body: ListView(
        children: [
          buildUnitCard('Weight', ['Kilograms (Kg)', 'Pounds (lbs)'], selectedWeightUnit, (newValue) {
            setState(() {
              selectedWeightUnit = newValue;
            });
          }),
          buildUnitCard('Height', ['Centimeters (cms)', 'Feet & Inches (ft/in)'], selectedHeightUnit, (newValue) {
            setState(() {
              selectedHeightUnit = newValue;
            });
          }),
          buildUnitCard('Distance', ['Kilometers (km)', 'Miles (miles)'], selectedDistanceUnit, (newValue) {
            setState(() {
              selectedDistanceUnit = newValue;
            });
          }),
          buildUnitCard('Volume', ['Millilitres (ml)', 'US Fluid Ounces (fl. oz)'], selectedVolumeUnit, (newValue) {
            setState(() {
              selectedVolumeUnit = newValue;
            });
          }),
        ],
      ),
    );
  }

  Widget buildUnitCard(String title, List<String> options, String selectedOption, Function(String) onChanged) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...options.map((option) {
              return Container(
                color: option == selectedOption ? Colors.grey[300] : Colors.transparent,
                child: ListTile(
                  title: Text(option),
                  trailing: option == selectedOption ? Image.asset('assets/tick.png', width: 20) : null,
                  onTap: () => onChanged(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

