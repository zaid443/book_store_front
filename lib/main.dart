import 'package:book_store/view/login_signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/profile/profile_page.dart';

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
      home:  Signin(),
    );
  }
}
