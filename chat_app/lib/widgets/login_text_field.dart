import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/testfield_styles.dart';

class LoginTextField extends StatelessWidget {
  //dynamic variables
  // variable datatype : var name
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;

  const LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.hasAsterisks = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) return validator!(value);
        return null;
      },
      controller: controller,
      obscureText: hasAsterisks,
      onChanged: (value) {
        if (kDebugMode) {
          print('value: $value');
        }
      },
      decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: const OutlineInputBorder()),
    );
  }
}
