import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/ads_by_author/ads_by_author_screen.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String authorToken;
  final int userId;
  UserInfo(
      {required this.userName,
      required this.authorToken,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F4F5),
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: FontStyles.semiBoldStyle(
                          fontSize: 24,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Text(
                        'был(а) вчера 19:35',
                        style: FontStyles.semiBoldStyle(
                            fontSize: 12,
                            fontFamily: 'Lato',
                            color: Color(0xff616161)),
                      ),
                      SizedBox(height: 13),
                      GestureDetector(
                        onTap: () => Get.to(() => AdsByAuthor(
                              userId: userId,
                              authorToken: authorToken,
                              userName: userName,
                            )),
                        child: Text(
                          'Все объявления автора',
                          style: FontStyles.semiBoldStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            undeline: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/icons/user.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
