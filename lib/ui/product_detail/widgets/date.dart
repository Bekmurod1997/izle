import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

Widget date({required String date}) {
  return Text(
    '$date',
    style: FontStyles.regularStyle(
      fontSize: 12,
      fontFamily: 'Lato',
      color: Color(0xff7F807F),
    ),
  );
}
