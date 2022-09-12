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
import '../../common/specialcards.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(height: 300, color: const Color(0xff073b4c)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
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
                const SizedBox(height: 20),
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
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: defaultBookList.length,
                          itemBuilder: (context, int index) {
                            return HorizontalList(
                                cover: defaultBookList[index].cover,
                                auther: defaultBookList[index].auther,
                                rate: defaultBookList[index].rate,
                                name: defaultBookList[index].name,
                              rateSize: 15,
                              onPressed: (Book book) {
                                Get.to(() => BookDetailsScreen(book: book));
                              },
                              item: defaultBookList[index],
                            );
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
                            item: defaultBookList[index],
                            onPressed: (Book book) {
                              Get.to(() => BookDetailsScreen(book: book));
                            },
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

