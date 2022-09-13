import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/app_bar.dart';
import 'package:book_store/common/book.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/default_book.dart';
import 'package:book_store/common/horizontal_card_list.dart';
import 'package:book_store/services/auth_service/auth.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


class Profile_page extends StatelessWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
        SizedBox(
        width: 400,
        height: 310,

       child: Stack(
        children: <Widget> [
          Image.asset(
              'assets/images/profile_bg.png',
              fit:BoxFit.fill,
              width: 600,
            height: 310,
                      ),
          const App_Bar(text: ''),


          Center(
            child: SvgPicture.asset(
              'assets/images/profile.svg',
              color: Colors.white,
                          fit:BoxFit.fill,
                          width: 120.07,
                          height:120.07,
                        ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 185),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child: Text('anonymous ',
                      style: GoogleFonts.inder
                        (fontSize: 30,
                        color: AppTheme.textwhite,
                      fontWeight: FontWeight.bold,)
                ),
                  ),


             Center(
        child: Text('0780 777 5777',
              style: GoogleFonts.cairo(fontSize: 20,
                color: AppTheme.textwhite, fontWeight: FontWeight.bold)
        ),
     ),

              ],
            ),
          ),



        ],
      ),
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20,left: 25),
                  child: Text('Your purchases', style: GoogleFonts.cairo
                    (fontSize: 23,color: AppTheme.textblack, fontWeight: FontWeight.bold)),
                ),
              ],
            ),





            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 290,
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
            ),

                 const TextButton(onPressed: AuthService.signOut, child: Padding(
                   padding:   EdgeInsets.only(top: 70),
                   child:  BorderedContainer(color:Color(0xCC931621),width:96 ,height:33 ,
                       child:MyButtonText(text:'Sign Out ', color: AppTheme.textwhite,fontSize: 15,)
                   ),
                 ),)







          ],));
  }
}
