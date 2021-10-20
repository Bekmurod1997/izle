import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontStyles {
  static boldStyle({
    required double fontSize,
    required String fontFamily,
    Color color = Colors.black,
    bool undeline = false,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none);
  }

  static thinStyle(
      {required double fontSize,
      required String fontFamily,
      bool undeline = false,
      Color color = Colors.black}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none,
        color: color);
  }

  static regularStyle(
      {required double fontSize,
      required String fontFamily,
      bool undeline = false,
      Color color = Colors.black}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none,
        color: color);
  }

  static mediumStyle(
      {required double fontSize,
      required String fontFamily,
      bool undeline = false,
      Color color = Colors.black}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none,
        color: color);
  }

  static semiBoldStyle(
      {required double fontSize,
      required String fontFamily,
      bool undeline = false,
      Color color = Colors.black}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none,
        color: color);
  }

  static blackStyle({
    required double fontSize,
    required String fontFamily,
    bool undeline = false,
    Color color = Colors.black,
    double letterSpace = 1.0,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily,
        decoration:
            undeline == true ? TextDecoration.underline : TextDecoration.none,
        color: color,
        letterSpacing: letterSpace);
  }
}
