import 'package:flutter/material.dart';

class O1 extends StatelessWidget {
  const O1({super.key});

  @override
  Widget build(BuildContext context) {
    var GlobalHeight = MediaQuery.of(context).size.height;
    // var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(253, 232, 234, 240),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: GlobalHeight * 0.2),
            child: Image.asset('lib/images/o1.png'),
          ),
        ],
      ),
    );
  }
}
