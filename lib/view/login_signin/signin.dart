import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/login_response.dart';
import 'package:book_store/common/navbar.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:book_store/view/signup_register/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:book_store/utils/theme.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store/Text_fields/Text_field.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _phoneNumberController = TextEditingController(text: kDebugMode ? '07806000499' : null);

  final TextEditingController _passwordController = TextEditingController(text: kDebugMode ? '12345678' : null);

  bool _isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // var register Register ;
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: formKey,
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
            style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textblack),
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
                MyTextField(
                  controller: _phoneNumberController,
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
                  controller: _passwordController,
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _isLoading
                  ? null
                  : () async {
                      if (formKey.currentState!.validate()) {
                        _signIn();
                      }
                    },
              child: BorderedContainer(
                  height: 61,
                  width: 173,
                  color: AppTheme.mainColor,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const MyButtonText(
                          text: 'Sign In',
                          color: AppTheme.textwhite,
                          fontSize: 26,
                        )),
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
                  style: GoogleFonts.cairo(fontSize: 18, color: const Color.fromARGB(255, 14, 132, 172)),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 50, left: 63),
              child: Row(
                children: [
                  Text(
                    'Don\'t have any account? ',
                    style: GoogleFonts.cairo(fontSize: 18, color: AppTheme.textblack),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic>? result = await Get.to(() => const Signup());
                      if (result != null) {
                        _phoneNumberController.text = result['phoneNumber'];
                        _passwordController.text = result['password'];
                      }
                    },
                    child: Text(
                      'Register',
                      style: GoogleFonts.cairo(fontSize: 18, color: const Color.fromARGB(255, 14, 132, 172)),
                    ),
                  )
                ],
              ))
        ]),
      ),
    ));
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    LoginResponse response = await AuthService().signIn(
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
    );
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      GetStorage localStorage = GetStorage();
      localStorage.write('token', response.token);
      localStorage.write('name', response.name);
      localStorage.write('phoneNumber', response.phone);
      localStorage.write('id', response.id);
      Get.offAll(() => const NavBarrr());
    } else {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(
        'Error',
        response.detail ?? "Some thing went",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
      );
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
