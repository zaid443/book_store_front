import 'package:book_store/common/constants.dart';
import 'package:book_store/common/login_response.dart';
import 'package:book_store/view/login_signin/signin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetConnect {
  AuthService() {
    httpClient.baseUrl = baseURl;
    httpClient.defaultContentType = defaultContType;
  }

  Future<LoginResponse> signIn({required String phoneNumber, required String password}) async {
    Response res = await post(
      '/signin',
      {
        "phone": phoneNumber,
        "password": password,
      },
    );
    print(res.body);
    return LoginResponse.fromJson(res.body, statusCode: res.statusCode);
  }

  Future<Response> signUp({required String phoneNumber, required String password, required String name}) async {
    Response res = await post(
      '/signup',
      {
        "name": name,
        "phone": phoneNumber,
        "password1": password,
        "password2": password,
      },
    );
    print(res.body);
    return res;
  }

  static signOut() async {
    await GetStorage().erase();
    Get.offAll(() => const SignIn());
  }
}
