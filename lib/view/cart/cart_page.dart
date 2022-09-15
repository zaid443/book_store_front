import 'package:book_store/view/cart/cart_book_card.dart';
import 'package:book_store/view/cart/cart_book_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../common/book.dart';
import '../home/book_details_screen.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    if (cart_books.isEmpty) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Text('Cart', style: GoogleFonts.cairo(fontSize: 25))),
            ),
            Container(
              height: 300,
              width: 95,
              child: Center(
                  child: Text('There is no book to buy',
                      style: GoogleFonts.cairo(fontSize: 25))),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          '${total_price}\$',
                          style: GoogleFonts.barlow(fontSize: 20),
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Total Pieces',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          '${total_piece}',
                          style: GoogleFonts.barlow(fontSize: 20),
                        )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xff073B4C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Buy',
                                style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  )),
            ))
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Text('Cart', style: GoogleFonts.cairo(fontSize: 25))),
            ),
            Container(
                height: 350,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        cart_books.length,
                        (index) => CartBookCard(
                          cover: cart_books[index].cover,
                          auther: cart_books[index].auther,
                          rate: cart_books[index].rate,
                          name: cart_books[index].name,
                          rateSize: 15,
                          price: cart_books[index].price,
                          item: cart_books[index],
                          onPressed: (Book book) {
                            Get.to(() => BookDetailsScreen(book: book));
                          },
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          '${total_price}\$',
                          style: GoogleFonts.barlow(fontSize: 20),
                        )),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text('Total Pieces',
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          '${total_piece}',
                          style: GoogleFonts.barlow(fontSize: 20),
                        )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xff073B4C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Buy',
                                style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  )),
            ))
          ],
        ),
      );
    }
  }
}
