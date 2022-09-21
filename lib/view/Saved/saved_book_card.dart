import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/view/Saved/savedbooklist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/book_model.dart';

class SavedBookCard extends StatefulWidget {
  const SavedBookCard(
      {Key? key,
      required this.cover,
      required this.name,
      required this.auther,
      required this.rate,
      required this.rateSize,
      required this.price,
      required this.item,
      required this.onPressed})
      : super(key: key);
  final String cover;
  final String name;
  final String auther;
  final double rate;
  final double price;
  final double rateSize;
  final BookModel item;
  final Function(BookModel book) onPressed;
  @override
  State<SavedBookCard> createState() => _SavedBookCardState();
}

class _SavedBookCardState extends State<SavedBookCard> {
  bool savestat = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(widget.item),
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
                child: Image.asset(
                  widget.cover,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.auther,
                  style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingStarsWidget(rate: widget.rate, iconSize: widget.rateSize),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.price.toString()}\$',
                  style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                iconSize: 30,
                color: const Color(0xffE9C46A),
                onPressed: () {
                  setState(() {
                    savestat = !savestat;
                    widget.item.saveMark = !widget.item.saveMark;
                  });
                  if (savestat && widget.item.saveMark) {
                    saveBooks.add(widget.item);
                  } else {
                    saveBooks.remove(widget.item);
                  }
                },
                icon: widget.item.saveMark ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline))
          ],
        ),
      ),
    );
  }
}
