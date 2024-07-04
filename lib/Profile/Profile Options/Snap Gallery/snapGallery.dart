import 'package:flutter/material.dart';

class SnapGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> imagesWithCalories = [
      {'image': 'assets/food_0.png', 'calories': '609 cals'},
      {'image': 'assets/food_1.png', 'calories': '520 cals'},
      {'image': 'assets/food_2.png', 'calories': '430 cals'},
      {'image': 'assets/food_3.png', 'calories': '390 cals'},
      {'image': 'assets/food_4.png', 'calories': '460 cals'},
      {'image': 'assets/food_5.png', 'calories': '540 cals'},
      {'image': 'assets/food_6.png', 'calories': '680 cals'},
      {'image': 'assets/food_7.png', 'calories': '750 cals'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Gallery',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40, // Increased main axis spacing
                  childAspectRatio: 0.85, // Adjust the aspect ratio to accommodate text
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imagesWithCalories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1, // Ensures the images are square
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagesWithCalories[index]['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        imagesWithCalories[index]['calories']!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
