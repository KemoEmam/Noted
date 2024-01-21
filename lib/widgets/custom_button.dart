import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.buttonColor});
  final String text;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
