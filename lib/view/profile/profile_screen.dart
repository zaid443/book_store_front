
import 'package:book_store/common/book.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/default_book.dart';
import 'package:book_store/common/horizontal_card_list.dart';
import 'package:book_store/services/auth.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff073b4c),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: Customshape(),
              child: Container(height: 350, color: const Color(0xff073b4c)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/profile.svg',
                        color: Colors.white,
                        fit: BoxFit.fill,
                        width: 120.07,
                        height: 120.07,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('anonymous ',
                          style: GoogleFonts.inder(
                            fontSize: 30,
                            color: AppTheme.textwhite,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('0780 777 5777',
                          style: GoogleFonts.cairo(
                              fontSize: 20,
                              color: AppTheme.textwhite,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('Your purchases',
                      style: GoogleFonts.cairo(
                          fontSize: 23,
                          color: AppTheme.textblack,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      PanaraConfirmDialog.showAnimatedGrow(
                        context,
                        title: "Sign Out",
                        message: "Do you want to Sign Out ?",
                        confirmButtonText: "No",
                        cancelButtonText: "Yes",
                        onTapCancel: AuthService.signOut,
                        onTapConfirm: () {
                          Get.back();
                        },
                        color: Color(0xCC931621),
                        panaraDialogType: PanaraDialogType.custom,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xCC931621),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('Sign Out ',
                            style: GoogleFonts.cairo(
                                color: AppTheme.textwhite,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
        );
  }
}







