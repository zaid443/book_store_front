import 'package:book_store/Text_fields/number_text_fields.dart';
import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/navbar.dart';
import 'package:book_store/view/login_signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store/Text_fields/Text_field.dart';

import '../home/home.dart';

class Signup extends StatelessWidget {
  Signup({
    Key? key,
  }) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController Phone_Number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Image.asset(
            'assets/images/book_store_logo1.png',
            width: 272.86,
            height: 204.65,
          ),
        ),
        Text(
          'Sign Up',
          style: GoogleFonts.cairo(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.textblack),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style:
                    GoogleFonts.cairo(fontSize: 16, color: AppTheme.textblack),
              ),
              MyTextField(
                controller: email,
              ),
              Text(
                'Phone Number',
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  color: AppTheme.textblack,
                ),
              ),
              MyTextFieldnum(
                controller: Phone_Number,
              ),
              Text(
                'Password',
                style:
                    GoogleFonts.cairo(fontSize: 16, color: AppTheme.textblack),
              ),
              MyTextField(controller: password, isSecure: true),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NavBarrr()));
            },
            child:
                const BorderedContainer(child: MyButtonText(text: 'Sign up')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signin()));
            },
            child: Text(
              'All ready have Account?',
              style: GoogleFonts.cairo(
                  fontSize: 18, color: Color.fromARGB(255, 14, 132, 172)),
            ),
          ),
        )
      ]),
    ));
  }
}
