import 'package:book_store/common/book_model.dart';
import 'package:book_store/services/book_service.dart';
import 'package:book_store/utils/enums.dart';
import 'package:get/get.dart';

class FilterResultController extends GetxController {
  late FilterType filterType;
  late String title;
  List<BookModel>? books;
  BookService bookService = BookService();
  bool isLoading = false;
  @override
  void onInit() {
    filterType = Get.arguments['filterType'];
    title = Get.arguments['title'];

    super.onInit();
  }

  @override
  void onReady() async {
    late Response<List<BookModel>> res;
    switch (filterType) {
      case FilterType.genre:
        isLoading = true;
        update();
        res = await bookService.getBooksByGenre(title);
        if (res.statusCode == 200 && res.body != null) {
          books = res.body;
        }
        isLoading = false;
        update();
        break;
      case FilterType.author:
        isLoading = true;
        update();
        res = await bookService.getBooksByAuthor(title);
        if (res.statusCode == 200 && res.body != null) {
          books = res.body;
        }
        isLoading = false;
        update();
        break;
    }
    super.onReady();
  }
}
