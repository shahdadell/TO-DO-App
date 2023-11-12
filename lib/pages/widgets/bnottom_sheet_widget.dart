import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  String? title;
  String? labelText;
  final int maxLines;
  Widget? suffix;
  bool obscureText;

   CustomTextFiled({
    super.key,
    this.title,
    this.labelText,
    this.controller,
    this.validator,
    this.maxLines=1,
    this.suffix,
    this.obscureText = false ,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: labelText,
        labelStyle: theme.textTheme.bodyLarge!.copyWith(
          color: Colors.black,
        ),
        hintText: title,
      ),

    );
  }
}
