import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/fonts.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F4F5),
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        'Азиз Ассомов',
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
                        onTap: () {},
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
