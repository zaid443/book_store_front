// ignore_for_file: unnecessary_string_escapes

import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

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
        ],
      ),
    );
  }
}
