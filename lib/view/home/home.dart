// ignore_for_file: unnecessary_string_escapes, non_constant_identifier_names

import 'package:book_store/controllers/home_controller.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:book_store/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../common/book_model.dart';
import '../../common/horizontal_card_list.dart';
import '../../common/specialcards.dart';
import '../../common/vertical_card_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final HomeController homeController = Get.put(HomeController());
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(height: 300, color: const Color(0xff073b4c)),
            ),
            GetBuilder<HomeController>(builder: (_) {
              return Column(
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
                          style: GoogleFonts.cairo(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Get.to(() => ProfilePage());
                          }),
                          child: SvgPicture.asset(
                            'assets/images/profile.svg',
                            color: Colors.white,
                            height: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: homeController.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : CarouselSlider(
                            items: homeController.newArrival
                                .map(
                                  (item) => BookCard(
                                    item: item,
                                    onPressed: (book) {
                                      Get.to(() => BookDetailsScreen(), arguments: book);
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
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Text(
                          'Top Rated',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: homeController.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(color: AppTheme.mainColor),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.topRated?.length ?? 0,
                                itemBuilder: (context, int index) {
                                  return HorizontalList(
                                    cover: homeController.topRated![index].bookImageUrl,
                                    author: homeController.topRated![index].author,
                                    rate: homeController.topRated![index].rate,
                                    name: homeController.topRated![index].name,
                                    rateSize: 15,
                                    onPressed: (BookModel book) {
                                      Get.to(
                                        () => BookDetailsScreen(),
                                        arguments: book,
                                      );
                                    },
                                    item: homeController.topRated![index],
                                  );
                                }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Top Seller',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        homeController.isLoading
                            ? const CircularProgressIndicator(
                                color: AppTheme.mainColor,
                              )
                            : Column(
                                children: List.generate(
                                  homeController.topSeller?.length ?? 0,
                                  (index) => BookCardExtended(
                                    item: homeController.topSeller![index],
                                    onPressed: (BookModel book) {
                                      Get.to(() => BookDetailsScreen(), arguments: book);
                                    },
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
