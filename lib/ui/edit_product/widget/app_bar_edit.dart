import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';

class EditAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 3,
        ),
        Container(
          child: Row(
            children: [
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => Get.back(),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    'assets/icons/next-icon.svg',
                    height: 20,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                'Редактировать объявления',
                style: FontStyles.boldStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 3,
        ),
      ],
    );
  }
}
