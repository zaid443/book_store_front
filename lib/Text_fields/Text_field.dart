import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    this.isSecure = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  final bool isSecure;
  final String? Function(String?)? validator;

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        child: TextFormField(
          style: const TextStyle(
            color: AppTheme.textblack,
            fontWeight: FontWeight.bold,
          ),
          controller: controller,
          obscureText: isSecure,
          textInputAction: TextInputAction.next,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ),
    );
  }
}
