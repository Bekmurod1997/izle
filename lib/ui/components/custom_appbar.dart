import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:marquee/marquee.dart';

AppBar customAppBar1(BuildContext context,
    {required String title, double eleveation = 0}) {
  return AppBar(
    centerTitle: true,
    elevation: eleveation,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: RotatedBox(
        quarterTurns: 2,
        child: SvgPicture.asset(
          'assets/icons/next-icon.svg',
          height: 18,
        ),
      ),
      onPressed: () => Get.back(),
    ),
    title: title.length > 15
        ? Container(
            height: 40,
            child: Marquee(
              text: '  ' + title.tr + '  ',
              style: FontStyles.boldStyle(
                fontSize: 24,
                fontFamily: 'Lato',
              ),
            ),
          )
        : Text(
            title.tr,
            style: FontStyles.boldStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            ),
          ),
  );
}
