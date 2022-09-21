import 'package:book_store/common/book_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  final BookService _bookService = BookService();
  List<BookModel> newArrival = [];
  List<BookModel>? topRated;
  List<BookModel>? topSeller;
  bool isLoading = false;

  @override
  void onReady() async {
    try {
      isLoading = true;
      update();
      List<Response<List<BookModel>>> responses =
          await Future.wait([_bookService.getNewArrival(), _bookService.getTopRated(), _bookService.getTopSeller()]);
      if (responses[0].statusCode == 200) {
        newArrival = responses[0].body!;
      }
      if (responses[1].statusCode == 200) {
        topRated = responses[1].body;
      }
      if (responses[2].statusCode == 200) {
        topSeller = responses[2].body;
      }
      isLoading = false;
      update();
    } catch (e) {
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
