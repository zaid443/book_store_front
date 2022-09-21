import 'package:book_store/common/book_model.dart';
import 'package:book_store/common/horizontal_card_list.dart';
import 'package:book_store/controllers/profile_controller.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final GetStorage localStorage = GetStorage();
  final ProfileController profileController = Get.put(ProfileController());
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
              clipper: CustomShape(),
              child: Container(height: 300, color: const Color(0xff073b4c)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
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
                      Text(localStorage.read('name'),
                          style: GoogleFonts.inder(
                            fontSize: 30,
                            color: AppTheme.textwhite,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        localStorage.read('phoneNumber'),
                        style: GoogleFonts.cairo(fontSize: 20, color: AppTheme.textwhite, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('Your purchases',
                      style: GoogleFonts.cairo(fontSize: 23, color: AppTheme.textblack, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ProfileController>(
                  builder: (_) {
                    return SizedBox(
                      height: 250,
                      child: profileController.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(color: AppTheme.mainColor),
                            )
                          : profileController.purchasedBooks?.isEmpty == true
                              ? const Center(
                                  child: Text('There are no books'),
                                )
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: profileController.purchasedBooks?.length ?? 0,
                                  itemBuilder: (context, int index) {
                                    return HorizontalList(
                                      cover: profileController.purchasedBooks![index].bookImageUrl,
                                      author: profileController.purchasedBooks![index].author,
                                      rate: profileController.purchasedBooks![index].rate,
                                      name: profileController.purchasedBooks![index].name,
                                      rateSize: 15,
                                      item: profileController.purchasedBooks![index],
                                      onPressed: (BookModel book) {
                                        Get.to(() => BookDetailsScreen(), arguments: book);
                                      },
                                    );
                                  }),
                    );
                  },
                ),
                const SizedBox(height: 50),
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
                        color: const Color(0xCC931621),
                        panaraDialogType: PanaraDialogType.custom,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration:
                          BoxDecoration(color: const Color(0xCC931621), borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('Sign Out ',
                            style: GoogleFonts.cairo(
                                color: AppTheme.textwhite, fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
