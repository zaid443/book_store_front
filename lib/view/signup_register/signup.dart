import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:book_store/utils/theme.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store/Text_fields/Text_field.dart';
import "package:get/get.dart";

class Signup extends StatefulWidget {
  const Signup({
    Key? key,
  }) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;
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
          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textblack),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 50,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.cairo(fontSize: 16, color: AppTheme.textblack),
                ),
                MyTextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                Text(
                  'Phone Number',
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    color: AppTheme.textblack,
                  ),
                ),
                MyTextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone is required';
                    } else if (value.length != 11) {
                      return "Phone number must be 11 characters";
                    }
                    return null;
                  },
                ),
                Text(
                  'Password',
                  style: GoogleFonts.cairo(fontSize: 16, color: AppTheme.textblack),
                ),
                MyTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isSecure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters.";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                _signUp();
              }
            },
            child: BorderedContainer(
                height: 61,
                width: 173,
                color: AppTheme.mainColor,
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const MyButtonText(
                        text: 'Sign Up',
                        color: AppTheme.textwhite,
                        fontSize: 26,
                      )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'All ready have Account?',
              style: GoogleFonts.cairo(fontSize: 18, color: const Color.fromARGB(255, 14, 132, 172)),
            ),
          ),
        )
      ]),
    ));
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });
    Response response = await AuthService()
        .signUp(phoneNumber: phoneNumberController.text, password: passwordController.text, name: nameController.text);
    if (response.statusCode == 200) {
      Get.back(result: {
        'phoneNumber': phoneNumberController.text,
        'password': passwordController.text,
      });
      setState(() {
        _isLoading = false;
      });
    } else {
      Get.snackbar(
        'Error',
        response.body['detail'] ?? "Some thing went",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
