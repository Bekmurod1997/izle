import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

Widget price({required String price}) {
  return Text(
    '$price сум',
    style:
        FontStyles.blackStyle(fontSize: 24, fontFamily: 'Lato', letterSpace: 2),
  );
}
