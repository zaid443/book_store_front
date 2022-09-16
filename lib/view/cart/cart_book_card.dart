import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/view/Saved/savedbooklist.dart';
import 'package:book_store/view/cart/cart_book_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:get/get.dart';
import '../../common/book.dart';

class CartBookCard extends StatefulWidget {
  const CartBookCard(
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
  final Book item;
  final Function(Book book) onPressed;
  @override
  State<CartBookCard> createState() => _CartBookCardState();
}

class _CartBookCardState extends State<CartBookCard> {
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
                  style: GoogleFonts.cairo(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.auther,
                  style: GoogleFonts.cairo(
                      fontSize: 15, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('${widget.item.pieces} Pcs'),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.price.toString()}\$',
                  style: GoogleFonts.cairo(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                iconSize: 30,
                color: const Color(0xff931621),
                onPressed: () {
                  setState(() {
                    PanaraConfirmDialog.showAnimatedGrow(
                      context,
                      title: "Remov from Cart",
                      message: "Do you want to remove this Book?",
                      confirmButtonText: "Cancel",
                      cancelButtonText: "Remove",
                      onTapCancel: () {
                        cart_books.remove(widget.item);
                        total_price =
                      total_price - (widget.item.pieces * widget.item.price);
                        total_piece = total_piece - widget.item.pieces;
                        widget.item.pieces = 0;
                        Get.back();
                      },
                      onTapConfirm: () {
                        Get.back();
                      },
                      color: const Color(0xff931621),
                      panaraDialogType: PanaraDialogType.custom,
                    );
                  });
                },
                icon: const Icon(Icons.do_disturb_on_outlined))
          ],
        ),
      ),
    );
  }
}
