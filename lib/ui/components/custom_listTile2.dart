import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class CustomListTile2 extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  // final doneIndex;
  final bool istabed;

  CustomListTile2(
      {required this.title, required this.onpress, required this.istabed});

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
              title,
              style: FontStyles.regularStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: istabed
                ? Icon(
                    Icons.done,
                    color: ColorPalate.lightGreen,
                  )
                : Container(
                    width: 10,
                    height: 10,
                  )),
        SizedBox(height: 5),
        Divider(),
      ],
    );
  }
}
