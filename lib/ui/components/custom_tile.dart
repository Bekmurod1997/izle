import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izle/constants/fonts.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  CustomTile({required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
              SvgPicture.asset(
                'assets/icons/next-icon.svg',
                height: 18,
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
