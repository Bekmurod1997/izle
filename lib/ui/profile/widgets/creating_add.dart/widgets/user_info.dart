import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izle/constants/fonts.dart';

class UserInfo extends StatelessWidget {
  final String title;
  final String userInfo;

  UserInfo({required this.title, required this.userInfo});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyles.regularStyle(
            fontSize: 16,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(height: 11),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userInfo,
                style: FontStyles.regularStyle(
                    fontSize: 16, fontFamily: 'Lato', color: Color(0xff616161)),
              ),
              SvgPicture.asset('assets/icons/check.svg')
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
