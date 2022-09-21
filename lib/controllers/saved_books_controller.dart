import 'package:book_store/common/book_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedBooksController extends GetxController {
  static SavedBooksController to = Get.find();
  BookService bookService = BookService();
  List<BookModel>? savedBooks;
  bool isLoading = false;

  @override
  void onReady() {
    fetchSavedBooks();
    super.onReady();
  }

  Future<void> fetchSavedBooks() async {
    try {
      isLoading = true;
      update();
      Response<List<BookModel>> res = await bookService.getSavedBooks;
      if (res.statusCode == 200 && res.body != null) {
        savedBooks = res.body?.map((savedBook) {
          savedBook.saveMark = true;
          return savedBook;
        }).toList();
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
  }

  Future<void> saveBook(
    BookModel book, {
    required Function() onSuccess,
  }) async {
    Response res = await bookService.saveBook(book.id);
    if (res.statusCode == 200 && res.body != null) {
      Get.snackbar(
        'Success',
        res.body['msg'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      savedBooks?.add(book);
      onSuccess();
    }
  }

  Future<void> unSaveBook(
    BookModel book, {
    required Function() onSuccess,
  }) async {
    Response res = await bookService.unSaveBook(book.id);
    if (res.statusCode == 200 && res.body != null) {
      onSuccess();
      savedBooks?.remove(book);
      update();
      Get.snackbar(
        'Success',
        res.body['msg'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
