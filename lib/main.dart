
import 'package:book_store/common/navbar.dart';
import 'package:book_store/view/home/home.dart';
import 'package:book_store/view/signup_register/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/Saved/saved_page.dart';
import 'view/login_signin/signin.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
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
        primarySwatch: Colors.blue,
      ),
        home: AnimatedSplashScreen(
            splashTransition: SplashTransition.fadeTransition,
            duration: 2000,
            backgroundColor: Color(0xff073B4C),
            splash: Center(
                child: Container(
              height: 250,
              width: 250,
              child: Image(image: AssetImage('assets/images/splash.png')),
            )),
            nextScreen: Signin())
    );
  }
}
