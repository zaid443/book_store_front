
import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  final String register='Register' ;

  @override
  Widget build(BuildContext context) {
    return  TextButton(
    onPressed: () {
    // Navigator.pop(context);
    },
    child: Text(register,style: GoogleFonts.cairo(fontSize: 18,
    color: AppTheme.textblack),),
    );

  }
}
