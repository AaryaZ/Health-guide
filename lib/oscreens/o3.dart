import 'package:flutter/material.dart';

Color bgblue = const Color.fromARGB(253, 232, 234, 240);

class O3 extends StatelessWidget {
  const O3({super.key});

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    // var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgblue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: GlobalHeight * 0.2),
            child: Image.asset('lib/images/o3.png'),
          ),
        ],
      ),
    );
  }
}
