import 'package:book_store/common/book_model.dart';
import 'package:book_store/controllers/cart_controller.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/view/cart/cart_book_card.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Cart',
                style: GoogleFonts.cairo(fontSize: 25, color: Colors.black))),
        elevation: 0,
        backgroundColor: Colors.transparent,
        excludeHeaderSemantics: true,
      ),
      body: SizedBox(
        height: Get.mediaQuery.size.height,
        width: Get.mediaQuery.size.width,
        child: GetBuilder<CartController>(builder: (_) {
          return Column(
            children: [
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppTheme.mainColor))
                    : controller.cartBooks?.isNotEmpty == true
                        ? ListView.builder(
                            itemCount: controller.cartBooks?.length ?? 0,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (_, index) {
                              return CartBookCard(
                                item: controller.cartBooks![index],
                                onPressed: (BookModel book) {
                                  Get.to(() => BookDetailsScreen(), arguments: book);
                                },
                                onRemove: controller.removeBook,
                              );
                            },
                          )
                        : Center(child: Text('There is no book to buy', style: GoogleFonts.cairo(fontSize: 25))),
              ),
              Container(
                width: Get.mediaQuery.size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Total Price', style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold)),
                              Center(
                                  child: Text(
                                '${controller.totalPrice}\$',
                                style: GoogleFonts.barlow(fontSize: 20),
                              )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Total Pieces', style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold)),
                              Center(
                                child: Text(
                                  controller.totalQuantity.toString(),
                                  style: GoogleFonts.barlow(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.mainColor,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
                        onPressed: controller.totalPrice == 0
                            ? null
                            : () {
                                PanaraConfirmDialog.showAnimatedGrow(
                                  context,
                                  title: "Buy",
                                  message: "Press Confirm to continue.",
                                  confirmButtonText: "Confirm",
                                  cancelButtonText: "Cancel",
                                  onTapCancel: () {
                                    Get.back();
                                  },
                                  onTapConfirm: controller.buyBooks,
                                  color: const Color(0xff073B4C),
                                  panaraDialogType: PanaraDialogType.custom,
                                );
                              },
                        child: Text(
                          'Buy',
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
