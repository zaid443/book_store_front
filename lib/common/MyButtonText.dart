
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonText extends StatelessWidget {
  const MyButtonText({
    Key? key,
    required this.text, required this.color, required this.fontSize,
  }) : super(key: key);
  final double fontSize;
  final String text;
  final  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cairo(fontSize:fontSize, color: color),
    );
  }
}