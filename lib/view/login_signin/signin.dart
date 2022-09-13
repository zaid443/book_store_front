import 'package:book_store/Text_fields/number_text_fields.dart';
import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/navbar.dart';
import 'package:book_store/view/home/home.dart';
import 'package:book_store/view/signup_register/signup.dart';
import 'package:flutter/material.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store/Text_fields/Text_field.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final TextEditingController Phone_Number = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var register Register ;
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
          'Sign in to Continue',
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
                  context, MaterialPageRoute(builder: (context) =>  NavBarrr()));
            },
            child:
                const BorderedContainer( height: 61,
                    width: 173,color: AppTheme.mainColor ,
                    child: MyButtonText(text: 'Sign in', color:AppTheme.textwhite,fontSize: 26,)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.cairo(
                    fontSize: 18, color: Color.fromARGB(255, 14, 132, 172)),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 50, left: 63),
            child: Row(
              children: [
                Text(
                  'Don\'t have any account? ',
                  style: GoogleFonts.cairo(
                      fontSize: 18, color: AppTheme.textblack),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.cairo(
                        fontSize: 18, color: Color.fromARGB(255, 14, 132, 172)),
                  ),
                )
              ],
            ))
      ]),
    ));
  }
}
