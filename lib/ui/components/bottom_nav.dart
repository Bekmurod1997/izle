import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/auth/auth_screen.dart';
import 'package:izle/ui/favorites/favorite_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/ui/profile/active_profile.dart';

class BottomNav extends StatelessWidget {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 21),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff038992),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                child: SvgPicture.asset(
                  pageNavigationController.pageControler.value == 1
                      ? 'assets/icons/home_active.svg'
                      : 'assets/icons/home.svg',
                ),
                onTap: () {
                  pageNavigationController.pageControler.value != 1
                      ? Get.offAll(() => NavScreen())
                      : print('print');
                  pageNavigationController.pageControllerChanger(1);
                }),
            // GestureDetector(
            //     child: SvgPicture.asset(
            //       pageNavigationController.pageControler.value == 1
            //           ? 'assets/icons/home_active.svg'
            //           : 'assets/icons/home.svg',
            //     ),
            //     onTap: () {
            //       pageNavigationController.pageControler.value != 1
            //           ? Get.offAll(() => NavScreen())
            //           : print('print');
            //       pageNavigationController.pageControllerChanger(1);
            //     }),
            GestureDetector(
              child: pageNavigationController.pageControler.value == 2
                  ? SvgPicture.asset(
                      'assets/icons/ss_active.svg',
                      height: 28,
                    )
                  : SvgPicture.asset(
                      'assets/icons/ss.svg',
                    ),
              onTap: () {
                pageNavigationController.pageControler.value != 2
                    ? Get.offAll(() => FavoriteScreen())
                    : print('printed');
                pageNavigationController.pageControllerChanger(2);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/icons/add3.svg',
              ),
              onTap: () {
                pageNavigationController.pageControler.value != 3
                    ? Get.offAll(() => AuthScreen())
                    : print('printed');
                pageNavigationController.pageControllerChanger(3);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                pageNavigationController.pageControler.value == 4
                    ? 'assets/icons/sms_active.svg'
                    : 'assets/icons/sms.svg',
              ),
              onTap: () {
                pageNavigationController.pageControler.value != 4
                    ? Get.offAll(() => MessageScreen(''))
                    : print('printed');
                pageNavigationController.pageControllerChanger(4);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                pageNavigationController.pageControler.value == 5
                    ? 'assets/icons/profile_active.svg'
                    : 'assets/icons/profile.svg',
              ),
              onTap: () {
                pageNavigationController.pageControler.value != 5
                    ? Get.offAll(() => ActiveProfileScreen())
                    : print('printed');
                pageNavigationController.pageControllerChanger(5);
              },
            ),
          ]),
        ));
  }
}
