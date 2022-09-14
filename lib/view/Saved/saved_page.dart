import 'package:book_store/view/Saved/saved_book_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../common/book.dart';
import '../../common/default_book.dart';
import '../../common/vertical_card_list.dart';
import '../home/book_details_screen.dart';
import 'savedbooklist.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    if (saveBooks.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                    child:
                        Text('Saved', style: GoogleFonts.cairo(fontSize: 25))),
              ),
              const SizedBox(
                height: 280,
              ),
              Center(
                child: Text(
                  'No Saved Books',
                  style: GoogleFonts.cairo(fontSize: 30, color: Colors.black45),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                    child:
                        Text('Saved', style: GoogleFonts.cairo(fontSize: 25))),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: List.generate(
                    saveBooks.length,
                    (index) => SavedBookCard(
                      cover: saveBooks[index].cover,
                      auther: saveBooks[index].auther,
                      rate: saveBooks[index].rate,
                      name: saveBooks[index].name,
                      rateSize: 15,
                      price: saveBooks[index].price,
                      item: saveBooks[index],
                      onPressed: (Book book) {
                        Get.to(() => BookDetailsScreen(book: book));
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
