import 'package:book_store/common/book_model.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList(
      {Key? key,
      required this.cover,
      required this.author,
      required this.rate,
      required this.name,
      required this.rateSize,
      required this.onPressed,
      required this.item})
      : super(key: key);
  final String cover;
  final String name;
  final String author;
  final double rate;
  final double rateSize;
  final BookModel item;
  final Function(BookModel book) onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(item),
      child: Container(
        width: 150,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 10),
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cover,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              author,
              style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 3,
            ),
            RatingStarsWidget(rate: rate, iconSize: rateSize)
          ],
        ),
      ),
    );
  }
}
