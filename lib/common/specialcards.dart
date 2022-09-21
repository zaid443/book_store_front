import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.item,
    required this.onPressed,
  }) : super(key: key);
  final BookModel item;
  final Function(BookModel book) onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(item),
      child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 0.5),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.bookImageUrl,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.author,
                      style: GoogleFonts.cairo(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        RatingStarsWidget(
                          iconSize: 20,
                          rate: item.rate,
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${item.price.toString()}\$',
                      style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w400),
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
