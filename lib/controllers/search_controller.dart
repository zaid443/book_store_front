import 'package:book_store/common/author_model.dart';
import 'package:book_store/common/genre_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  BookService bookService = BookService();
  List<GenreModel>? genres;
  List<AuthorModel>? authors;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  bool genreFlag = true;
  bool authorFlag = false;
  @override
  void onReady() async {
    try {
      isLoading = true;
      update();
      List<Response> responses = await Future.wait([
        bookService.getAllGenres,
        bookService.getAllAuthors,
      ]);
      if (responses[0].statusCode == 200 && responses[0].body != null) {
        genres = responses[0].body;
      }
      if (responses[1].statusCode == 200 && responses[1].body != null) {
        authors = responses[1].body;
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
      isLoading = false;
      update();
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
      );
    }
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
