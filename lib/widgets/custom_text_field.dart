import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.borderColor,
      this.textInputType,
      this.onChanged,
      this.obscureText = false,
      required this.hintText,
      required this.cursorColor,
      required this.textColor,
      required this.focusedBorderColor,
      this.maxLines = 1});
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Color borderColor;
  final Color textColor;
  final Color focusedBorderColor;
  final Color cursorColor;
  final TextInputType? textInputType;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: cursorColor,
      keyboardType: textInputType,
      obscureText: obscureText!,
      style: TextStyle(color: textColor),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: borderBuilder(),
        enabledBorder: borderBuilder(borderColor),
        focusedBorder: borderBuilder(focusedBorderColor),
      ),
    );
  }

  OutlineInputBorder borderBuilder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
