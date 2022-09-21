import 'package:book_store/common/navbar.dart';
import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'view/login_signin/signin.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        colorSchemeSeed: AppTheme.mainColor,
      ),
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        backgroundColor: const Color(0xff073B4C),
        splash: const Center(
            child: SizedBox(
          height: 250,
          width: 250,
          child: Image(image: AssetImage('assets/images/splash.png')),
        )),
        nextScreen: GetStorage().read('token') != null ? const NavBarrr() : const SignIn(),
      ),
    );
  }
}
