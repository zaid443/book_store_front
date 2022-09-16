import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import '../../common/book.dart';
import '../Saved/savedbooklist.dart';
import '../cart/cart_book_list.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  final Book book;
  
  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool savestat = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff073b4c),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 20)
                ]),
                height: 273,
                width: 181,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.book.cover,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 20)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.book.price.toString()}\$',
                          style: GoogleFonts.cairo(fontSize: 18)),
                      Row(
                        children: [
                          Text(widget.book.name.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 22, fontWeight: FontWeight.w400)),
                          const Spacer(),
                          IconButton(
                              iconSize: 30,
                              color: const Color(0xffE9C46A),
                              onPressed: () {
                                setState(() {
                                  savestat = !savestat;
                                  widget.book.saveMark = !widget.book.saveMark;
                                });
                                if (savestat == true && widget.book.saveMark == true ) {
                                    saveBooks.add(widget.book);
                                    } else {
                                    saveBooks.remove(widget.book);
                                    }
                              },
                              icon: widget.book.saveMark == true
                                  ? const Icon(Icons.bookmark)
                                  : const Icon(Icons.bookmark_outline))
                        ],
                      ),
                      Text(widget.book.auther,
                          style: GoogleFonts.cairo(fontSize: 18)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8),
                        height: 85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color.fromARGB(56, 253, 203, 86)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('Rate',
                                    style: GoogleFonts.cairo(fontSize: 16)),
                                Text(widget.book.rate.toString(),
                                    style: GoogleFonts.cairo(fontSize: 16)),
                              ],
                            ),
                            const VerticalDivider(
                              endIndent: 8,
                              indent: 8,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Text('Pages',
                                    style: GoogleFonts.cairo(fontSize: 16)),
                                Text('200',
                                    style: GoogleFonts.cairo(fontSize: 16)),
                              ],
                            ),
                            const VerticalDivider(
                              endIndent: 8,
                              indent: 8,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Text('Language',
                                    style: GoogleFonts.cairo(fontSize: 16)),
                                Text('English',
                                    style: GoogleFonts.cairo(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.book.discrption,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(56, 253, 203, 86),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('QTY',
                                        style: GoogleFonts.cairo(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 0) {
                                              quantity = quantity - 1;
                                            } else {
                                              print('no');
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove)),
                                    Text(
                                      quantity.toString(),
                                      style: GoogleFonts.barlow(fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        icon: Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                PanaraConfirmDialog.showAnimatedGrow(
                                  context,
                                  
                                  title: "Add to cart",
                                  message:
                                      "Do you want to Add this Book to Cart?",
                                  confirmButtonText: "Add",
                                  cancelButtonText: "Cancel",
                                  onTapCancel: () {
                                    Get.back();
                                  },
                                  onTapConfirm: () {
                                    cart_books.add(widget.book);
                                total_price = total_price + (widget.book.price * quantity);
                                total_piece = total_piece + quantity;
                                widget.book.pieces = widget.book.pieces + quantity;
                                    Get.back();
                                  },
                                  color: Color(0xff073B4C),
                                  panaraDialogType: PanaraDialogType.custom,
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xff073b4c),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text('Add To Cart',
                                      style: GoogleFonts.cairo(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ], 
      ),
    );
  }
}
