import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class ProfileListTile extends StatelessWidget {
  final bool isAmount;
  final String title;
  final VoidCallback onpress;
  final bool isDivider;
  final String? amount;
  final String iconUrl;
  ProfileListTile({
    required this.title,
    required this.onpress,
    required this.iconUrl,
    this.isDivider = true,
    this.isAmount = false,
    this.amount,
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
          leading: Stack(
            children: [
              SvgPicture.asset(
                iconUrl,
                height: 20,
                color: ColorPalate.mainColor,
              ),
              if (isAmount == true)
                Positioned(
                    right: 1,
                    top: 8,
                    child: Text(
                      amount.toString(),
                      style: TextStyle(
                        color: ColorPalate.mainColor,
                        fontSize: 12.0,
                      ),
                    ))
            ],
          ),
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            title,
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
