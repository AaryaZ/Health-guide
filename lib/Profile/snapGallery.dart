import 'package:flutter/material.dart';

class SnapGalleryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Gallery',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(8, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/food_$index.png', // Use your asset image paths
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
