// ignore_for_file: unnecessary_string_escapes, non_constant_identifier_names

import 'package:book_store/common/default_book.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../common/book.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            margin: const EdgeInsets.only(top: 150),
            child: CarouselSlider(
              items: imgPath
                  .map((item) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 500,
                          ),
                        ),
                      ))
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
          )
        ],
      ),
    );
  }
}

// Widget AnimList(BuildContext context, int index) {
//   Books book = default_book_list[index];
//   return Container(

//     margin: EdgeInsets.symmetric(horizontal: 50),
//     child: Expanded(
//       child: Image.asset(book.cover),
//     ),
//   );
// }

// Widget CircularSlider(String imgPath, int index) {
//   Books book = default_book_list[index];
//   return Container(
//     height: 200,
//     child: Image.asset(
//       book.cover,
//       fit: BoxFit.cover,
//     ),
//   );
// }
