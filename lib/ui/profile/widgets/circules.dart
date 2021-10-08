import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';

class Circules extends StatelessWidget {
  final Color color;
  final double leftSide;
  final double rightSide;
  final double topSide;

  const Circules(
      {Key? key,
      required this.color,
      required this.leftSide,
      required this.rightSide,
      required this.topSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftSide,
      right: rightSide,
      top: topSide,
      child: Container(
        height: 18,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              width: 3,
              color: ColorPalate.mainColor,
            )),
      ),
    );
  }
}
