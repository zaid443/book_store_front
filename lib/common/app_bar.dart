import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App_Bar extends StatelessWidget {
  const App_Bar({
    required this.text,
    Key? key,
  }) : super(key: key);


  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 25, color: AppTheme.textwhite),
          ),
          //Expanded(child: SizedBox()),
          Text(
             text,
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: AppTheme.textblack,
              ),
          )
        ],
      ),
    );
  }
}