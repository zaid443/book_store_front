import 'package:book_store/services/shared_preferences.dart';
import 'package:book_store/view/login_signin/signin.dart';
import 'package:get/get.dart' hide Response;

class AuthService{

  static signOut(){
    // Database.prefs.remove('email');
    // Database.prefs.remove('password');
    Get.offAll(Signin());
  }
}