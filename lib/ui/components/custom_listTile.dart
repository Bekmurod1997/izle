import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final bool isDivider;
  final bool isIcon;
  CustomListTile({
    required this.title,
    required this.onpress,
    this.isDivider = true,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
          onTap: onpress,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            title.tr,
            style: FontStyles.regularStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          trailing: SvgPicture.asset(
            'assets/icons/next-icon.svg',
            height: 20,
          ),
        ),
        SizedBox(height: 5),
        isDivider ? Divider() : Container(),
      ],
    );
  }
}
