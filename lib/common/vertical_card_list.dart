import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book_model.dart';

class BookCardExtended extends StatelessWidget {
  const BookCardExtended({
    Key? key,
    required this.item,
    required this.onPressed,
    this.onSavePressed,
    this.showSaveButton = false,
  }) : super(key: key);
  final bool showSaveButton;
  final BookModel item;
  final Function(BookModel book) onPressed;
  final VoidCallback? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(item),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 135,
              width: 95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.bookImageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.author,
                    style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      RatingStarsWidget(rate: item.rate, iconSize: 15),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${item.price.toString()}\$',
                    style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            if (showSaveButton)
              IconButton(
                iconSize: 30,
                color: const Color(0xffE9C46A),
                onPressed: onSavePressed,
                icon: item.saveMark ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline),
              )
          ],
        ),
      ),
    );
  }
}
