import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.item,
    required this.onPressed,
  }) : super(key: key);
  final Book item;
  final Function(Book book) onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(item),
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 239, 239),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 0.5),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item.cover,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.auther,
                      style: GoogleFonts.cairo(
                          color: const Color.fromARGB(166, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RatingStarsWidget(
                      size: 20,
                      rate: item.rate,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${item.price.toString()}\$',
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Tap to see more >>',
                      style: GoogleFonts.cairo(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
