import 'package:book_store/common/book_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<BookModel>? purchasedBooks;
  bool isLoading = false;

  @override
  void onReady() async {
    try {
      isLoading = true;
      update();
      Response<List<BookModel>> res = await BookService().getPurchased;
      if (res.statusCode == 200 && res.body != null) {
        purchasedBooks = res.body;
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
}
