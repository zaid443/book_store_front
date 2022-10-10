import 'package:book_store/controllers/book_details_controller.dart';
import 'package:book_store/controllers/saved_books_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({Key? key}) : super(key: key);
  final BookDetailsController controller = Get.put(BookDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: const Color(0xff073b4c),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
                height: 273,
                width: 181,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      controller.book.bookImageUrl,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GetBuilder<BookDetailsController>(
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${controller.book.price.toString()}\$', style: GoogleFonts.cairo(fontSize: 18)),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.book.name.toString(),
                                  style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w400),
                                ),
                              ),
                              IconButton(
                                iconSize: 30,
                                color: const Color(0xffE9C46A),
                                onPressed: () {
                                  if (!controller.book.saveMark) {
                                    controller.book.saveMark = true;
                                    SavedBooksController.to.saveBook(controller.book, onSuccess: () {
                                      controller.toggleSaveState();
                                    });
                                  } else {
                                    controller.book.saveMark = false;
                                    SavedBooksController.to.unSaveBook(controller.book, onSuccess: () {
                                      controller.toggleSaveState();
                                    });
                                  }
                                },
                                icon: controller.saveState == true
                                    ? const Icon(Icons.bookmark)
                                    : const Icon(Icons.bookmark_outline),
                              )
                            ],
                          ),
                          Text(controller.book.author, style: GoogleFonts.cairo(fontSize: 18)),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(8),
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13), color: const Color.fromARGB(56, 253, 203, 86)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('Rate', style: GoogleFonts.cairo(fontSize: 16)),
                                    Text(controller.book.rate.toString(), style: GoogleFonts.cairo(fontSize: 16)),
                                  ],
                                ),
                                const VerticalDivider(
                                  endIndent: 8,
                                  indent: 8,
                                  color: Colors.black,
                                ),
                                Column(
                                  children: [
                                    Text('Pages', style: GoogleFonts.cairo(fontSize: 16)),
                                    Text(controller.book.pages.toString(), style: GoogleFonts.cairo(fontSize: 16)),
                                  ],
                                ),
                                const VerticalDivider(
                                  endIndent: 8,
                                  indent: 8,
                                  color: Colors.black,
                                ),
                                Column(
                                  children: [
                                    Text('Language', style: GoogleFonts.cairo(fontSize: 16)),
                                    Text('English', style: GoogleFonts.cairo(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.book.description,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(56, 253, 203, 86),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text('QTY',
                                            style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.bold)),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: controller.decreaseQuantity, icon: const Icon(Icons.remove)),
                                        Text(
                                          controller.quantity.toString(),
                                          style: GoogleFonts.barlow(fontSize: 20),
                                        ),
                                        IconButton(onPressed: controller.increaseQuantity, icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 35),
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: controller.isLoading
                                      ? null
                                      : () {
                                          PanaraConfirmDialog.showAnimatedGrow(
                                            context,
                                            title: "Add to cart",
                                            message: "Do you want to Add this Book to Cart?",
                                            confirmButtonText: "Add",
                                            cancelButtonText: "Cancel",
                                            onTapCancel: () {
                                              Get.back();
                                            },
                                            onTapConfirm: () {
                                              Get.back();
                                              controller.addToCart();
                                            },
                                            color: const Color(0xff073B4C),
                                            panaraDialogType: PanaraDialogType.custom,
                                          );
                                        },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff073b4c), borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: controller.isLoading
                                          ? const CircularProgressIndicator(color: Colors.white)
                                          : Text(
                                              'Add To Cart',
                                              style: GoogleFonts.cairo(
                                                  fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
