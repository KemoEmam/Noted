import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.borderColor,
      this.textInputType,
      this.onChanged,
      this.obscureText = false,
      required this.hintText,
      this.cursorColor,
      this.textColor,
      required this.focusedBorderColor,
      this.maxLines = 1,
      this.onSaved,
      this.validator});
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Color borderColor;
  final Color? textColor;
  final Color focusedBorderColor;
  final Color? cursorColor;
  final TextInputType? textInputType;
  final int maxLines;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required!';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: cursorColor ?? focusedBorderColor,
      keyboardType: textInputType,
      obscureText: obscureText!,
      style: TextStyle(color: textColor ?? borderColor),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: borderColor),
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
