import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/page_navgation_controller.dart';

class CreatAppBar extends StatelessWidget {
  static PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  const CreatAppBar({Key? key}) : super(key: key);

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
                onTap: () {
                  pageNavigationController.pageControllerChanger(0);
                  pageNavigationController.tabIndexChanger(0);
                },
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
                'Создать объявления',
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
