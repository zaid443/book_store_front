import 'package:book_store/common/book_model.dart';
import 'package:book_store/common/vertical_card_list.dart';
import 'package:book_store/controllers/home_controller.dart';
import 'package:book_store/controllers/saved_books_controller.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPage extends StatelessWidget {
  SavedPage({Key? key}) : super(key: key);
  final SavedBooksController savedBooksController = Get.put(SavedBooksController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: GoogleFonts.cairo(fontSize: 25, textStyle: const TextStyle(color: Colors.black)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<SavedBooksController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: savedBooksController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppTheme.mainColor),
                )
              : savedBooksController.savedBooks?.isEmpty == true
                  ? const Center(
                      child: Text('There are no books'),
                    )
                  : ListView.builder(
                      itemCount: savedBooksController.savedBooks?.length ?? 0,
                      itemBuilder: (ctx, index) {
                        return BookCardExtended(
                          showSaveButton: true,
                          item: savedBooksController.savedBooks![index],
                          onPressed: (BookModel book) {
                            Get.to(() => BookDetailsScreen(), arguments: book);
                          },
                          onSavePressed: () {
                            BookModel book = savedBooksController.savedBooks![index];
                            savedBooksController.unSaveBook(
                              book,
                              onSuccess: () {
                                HomeController.to.topSeller?.firstWhereOrNull((element) => element == book)?.saveMark =
                                    false;
                              },
                            );
                          },
                        );
                      }),
        );
      }),
    );
  }
}
