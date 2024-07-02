import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19, 157), 
      ),
      body: ListView(
        children: [
          buildReportCard('Daily Report'),
        ],
      ),
    );
  }

  Widget buildReportCard(String title) {
    return Card(
      color: Color.fromARGB(255, 228, 226, 226),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
