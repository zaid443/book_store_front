import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList(
      {Key? key,
      required this.cover,
      required this.auther,
      required this.rate,
      required this.name,
      required this.rateSize})
      : super(key: key);
  final String cover;
  final String name;
  final String auther;
  final double rate;
  final double rateSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 239, 239),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 10),
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            auther,
            style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 3,
          ),
          RatingStarsWidget(rate: rate, size: rateSize)
        ],
      ),
    );
  }
}
