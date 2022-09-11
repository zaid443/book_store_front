// ignore_for_file: unnecessary_string_escapes, non_constant_identifier_names

import 'package:book_store/common/default_book.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../common/book.dart';
import '../../common/horizontal_card_list.dart';
import '../../common/vertical_card_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(height: 300, color: Color(0xff073b4c)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New Arrival',
                        style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SvgPicture.asset(
                        'assets/images/profile.svg',
                        color: Colors.white,
                        height: 35,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    items: defaultBookList
                        .map(
                          (item) => BookCard(
                            item: item,
                            onPressed: (book) {
                              Get.to(() => BookDetailsScreen(book: book));
                            },
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        initialPage: 3,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        height: 400),
                  ),
                ),
                // TOP RATED
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Text(
                        'Top Rated',
                        style: GoogleFonts.cairo(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: defaultBookList.length,
                          itemBuilder: (context, int index) {
                            return HorizontalList(
                                cover: defaultBookList[index].cover,
                                auther: defaultBookList[index].auther,
                                rate: defaultBookList[index].rate,
                                name: defaultBookList[index].name,
                                rateSize: 15);
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Top Seller',
                        style: GoogleFonts.cairo(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                          defaultBookList.length,
                          (index) => BookCardExtended(
                            cover: defaultBookList[index].cover,
                            auther: defaultBookList[index].auther,
                            rate: defaultBookList[index].rate,
                            name: defaultBookList[index].name,
                            rateSize: 15,
                            price: defaultBookList[index].price,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
              color: Color.fromARGB(255, 246, 239, 239),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 0.5),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
                margin: EdgeInsets.only(left: 8),
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
                          color: Color.fromARGB(166, 0, 0, 0),
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
