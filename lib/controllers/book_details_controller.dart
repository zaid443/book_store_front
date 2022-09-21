import 'package:book_store/common/book_model.dart';
import 'package:book_store/controllers/cart_controller.dart';
import 'package:book_store/controllers/saved_books_controller.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController {
  bool saveState = false;
  int quantity = 1;
  bool isLoading = false;
  late final BookModel book;
  @override
  void onInit() {
    book = Get.arguments;
    book.saveMark = SavedBooksController.to.savedBooks?.contains(book) == true;
    saveState = book.saveMark;
    super.onInit();
  }

  void toggleSaveState() {
    saveState = !saveState;
    update();
  }

  void increaseQuantity() {
    quantity = quantity + 1;
    update();
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      quantity = quantity - 1;
      update();
    }
  }

  Future<void> addToCart() async {
    try {
      isLoading = true;
      update();
      Response res = await BookService().addToCart(book.id, quantity);
      if (res.statusCode == 200 && res.body != null) {
        book.qty = quantity;
        CartController.to.fetchCartBooks();
        Get.snackbar(
          'Success',
          res.body['msg'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
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
}
