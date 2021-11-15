import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

Widget title({required String title}) {
  return Text(
    title,
    style: FontStyles.regularStyle(
      fontSize: 24,
      fontFamily: 'Lato',
    ),
  );
}
