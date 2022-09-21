import 'package:book_store/common/book_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController to = Get.find();
  BookService bookService = BookService();
  List<BookModel>? cartBooks;
  bool isLoading = false;
  int totalQuantity = 0;
  double totalPrice = 0;

  @override
  void onReady() {
    fetchCartBooks();
    super.onReady();
  }

  Future<void> fetchCartBooks() async {
    try {
      isLoading = true;
      update();
      Response<List<BookModel>> res = await bookService.getCartBooks;
      if (res.statusCode == 200 && res.body != null) {
        cartBooks = res.body;
        if (totalPrice != 0) {
          totalPrice = 0;
          totalQuantity = 0;
        }
        for (BookModel book in cartBooks!) {
          totalQuantity += book.qty;
          totalPrice += book.price * book.qty;
        }
      } else if (res.statusCode == 201) {
        cartBooks = [];
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

  Future<void> removeBook(BookModel book) async {
    try {
      Response res = await bookService.removeFromCart(book.id);
      if (res.statusCode == 200 && res.body != null) {
        cartBooks?.remove(book);
        totalPrice -= book.price * book.qty;
        totalQuantity -= book.qty;
      }
      Get.back();
      update();
      Get.snackbar(
        'Success',
        res.body['msg'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(Icons.check, color: Colors.white),
        shouldIconPulse: true,
      );
    } catch (e) {
      print(e.toString());
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

  Future<void> buyBooks() async {
    try {
      Response res = await bookService.buyBooks();
      if (res.statusCode == 200 && res.body != null) {
        cartBooks?.clear();
        totalPrice = 0;
        totalQuantity = 0;
        Get.back();
        Get.snackbar(
          'Success',
          "Thank you for your purchase",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(Icons.check, color: Colors.white),
          shouldIconPulse: true,
        );
      }
      update();
    } catch (e) {
      print(e.toString());
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
}
