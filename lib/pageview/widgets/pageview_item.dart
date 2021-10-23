import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';

class PageViewItem extends StatelessWidget {
  final String imageUrl;
  final String titile;
  PageViewItem({required this.imageUrl, required this.titile});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 40),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Image.asset(imageUrl)),
        Container(height: 40),
        Center(
            child: Text(
          titile,
          style: TextStyle(
            fontSize: 20,
            color: ColorPalate.mainColor,
          ),
        )),
      ],
    );
  }
}
