import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

Widget address({required String address}) {
  return Text(
    '$address',
    style: FontStyles.regularStyle(
      fontSize: 18,
      fontFamily: 'Lato',
      color: Color(0xff7F807F),
    ),
  );
}
