import 'package:book_store/common/author_model.dart';
import 'package:book_store/common/book_model.dart';
import 'package:book_store/common/constants.dart';
import 'package:book_store/common/genre_model.dart';
import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

class BookService extends GetConnect {
  final GetStorage _localStorage = GetStorage();
  BookService() {
    httpClient.baseUrl = baseURl;
    httpClient.defaultContentType = defaultContType;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer ${GetStorage().read('token')}';
      return request;
    });
  }
  Future<Response<List<BookModel>>> getNewArrival() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>('/get_10top_new_arrival', decoder: (data) {
      return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
    });
    return res;
  }

  Future<Response<List<BookModel>>> getTopRated() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>('/get_10top_rated', decoder: (data) {
      return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
    });
    return res;
  }

  Future<Response<List<BookModel>>> getTopSeller() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>('/get_10top_sales', decoder: (data) {
      return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
    });
    return res;
  }

  Future<Response<List<BookModel>>> get getPurchased async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>(
      '/get_all_purchased_books/$userId',
      decoder: (data) {
        if (data is List) {
          return List<BookModel>.from(data.map((item) {
            item['book']['qty'] = item['qty'];
            return BookModel.fromJson(item['book']);
          }));
        }
        return [];
      },
    );
    return res;
  }

  Future<Response> buyBooks() async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response res = await get('/Buy_items/$userId');
    return res;
  }

  Future<Response<List<BookModel>>> get getSavedBooks async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>(
      '/get_all_saved_books/$userId',
      decoder: (data) {
        return List<BookModel>.from(data.map((item) => BookModel.fromJson(item['book'])));
      },
    );
    return res;
  }

  Future<Response<List<GenreModel>>> get getAllGenres async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<GenreModel>> res = await get(
      '/get_all_genres',
      decoder: (data) => List<GenreModel>.from(data.map((item) => GenreModel.fromJson(item))),
    );
    return res;
  }

  Future<Response<List<AuthorModel>>> get getAllAuthors async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<AuthorModel>> res = await get(
      '/get_all_authors',
      decoder: (data) => List<AuthorModel>.from(data.map((item) => AuthorModel.fromJson(item))),
    );
    return res;
  }

  Future<Response<List<BookModel>>> getBooksByGenre(String genre) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>('/get_all_books_by_genre/$genre', decoder: (data) {
      return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
    });
    return res;
  }

  Future<Response<List<BookModel>>> getBooksByAuthor(String author) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>('/get_all_books_by_author/$author', decoder: (data) {
      return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
    });
    return res;
  }

  Future<Response> saveBook(int bookId) async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response res = await get('/save_book/$userId/$bookId');
    return res;
  }

  Future<Response> unSaveBook(int bookId) async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response res = await get('/unsave_book/$userId/$bookId');
    return res;
  }

  Future<Response<List<BookModel>>> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get(
      '/search',
      query: {
        "q": query,
      },
      decoder: (data) {
        return List<BookModel>.from(data.map((item) => BookModel.fromJson(item)));
      },
    );
    return res;
  }

  Future<Response> addToCart(int bookId, int quantity) async {
    int userId = _localStorage.read('id');
    Response res = await post(
      "/add_cart_items",
      {"user_id": userId, "book_id": bookId, "qty": quantity},
    );
    return res;
  }

  Future<Response> removeFromCart(int bookId) async {
    int userId = _localStorage.read('id');
    Response res = await post(
      "/remove_cart_items",
      {"user_id": userId, "book_id": bookId},
    );
    return res;
  }

  Future<Response<List<BookModel>>> get getCartBooks async {
    int userId = _localStorage.read('id');
    await Future.delayed(const Duration(milliseconds: 500));
    Response<List<BookModel>> res = await get<List<BookModel>>(
      '/get_personal_cart_items/$userId',
      decoder: (data) {
        if (data is List) {
          return List<BookModel>.from(data.map((item) {
            item['book']['qty'] = item['qty'];
            return BookModel.fromJson(item['book']);
          }));
        }
        return [];
      },
    );
    return res;
  }
}
