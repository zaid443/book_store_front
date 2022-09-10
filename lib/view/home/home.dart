// ignore_for_file: unnecessary_string_escapes, non_constant_identifier_names

import 'package:book_store/common/default_book.dart';
import 'package:book_store/common/ratin_star.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 300,
                color: Color(0xff073b4c),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 25),
              child: Text(
                'New Arrival',
                style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 60, left: 350),
                child: SvgPicture.asset(
                  'assets/images/profile.svg',
                  color: Colors.white,
                  height: 35,
                )),
            Container(
              height: 200,
              width: 500,
              margin: const EdgeInsets.only(top: 150),
              child: CarouselSlider(
                items: default_book_list
                    .map((item) => Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 239, 239),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(horizontal: 0.5),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item.cover,
                                  height: 350,
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
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
                        )))
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
            Container(
              margin: EdgeInsets.only(left: 25, top: 380),
              child: Text(
                'Top Rated',
                style: GoogleFonts.cairo(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.only(left: 25, top: 430),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: default_book_list.length,
                  itemBuilder: (context, int index) {
                    return HorizontalList(
                        cover: default_book_list[index].cover,
                        auther: default_book_list[index].auther,
                        rate: default_book_list[index].rate,
                        name: default_book_list[index].name,
                        rateSize: 15);
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 700),
              child: Text(
                'Top Seller',
                style: GoogleFonts.cairo(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400,
              margin: EdgeInsets.only(left: 25, top: 740, right: 20),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: default_book_list.length,
                  itemBuilder: (context, int index) {
                    return VericalList(
                      cover: default_book_list[index].cover,
                      auther: default_book_list[index].auther,
                      rate: default_book_list[index].rate,
                      name: default_book_list[index].name,
                      rateSize: 15,
                      price: default_book_list[index].price,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


