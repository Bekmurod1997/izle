import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CutomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color buttonColor;
  final Color textColor;
  CutomeButton({
    required this.title,
    required this.onpress,
    required this.buttonColor,
    required this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title.tr,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
