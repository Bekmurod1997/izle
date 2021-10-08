import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izle/constants/fonts.dart';

class CardIconModel extends StatelessWidget {
  final String iconUrl;
  final String title;
  final double fontsize;
  final double iconHeight;
  final bool semiBold;
  CardIconModel({
    required this.iconUrl,
    required this.title,
    required this.fontsize,
    required this.iconHeight,
    this.semiBold = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            height: iconHeight,
          ),
          SizedBox(width: 15),
          Text(
            title,
            style: semiBold == false
                ? FontStyles.regularStyle(
                    fontSize: fontsize,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  )
                : FontStyles.semiBoldStyle(
                    fontSize: fontsize,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
            // style: TextStyle(fontSize: fontsize),
          )
        ],
      ),
    );
  }
}
