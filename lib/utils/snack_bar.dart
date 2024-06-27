import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBarHG {
  final String title;
  final String text;
  const SnackBarHG({required this.title, required this.text});

  SnackBar show() {
    return SnackBar(
      duration: Duration(milliseconds: 1200),
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 90,
            decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        text,
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: Icon(
              Icons.warning_rounded,
              color: Colors.red,
              size: 40,
            ),
          )
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
