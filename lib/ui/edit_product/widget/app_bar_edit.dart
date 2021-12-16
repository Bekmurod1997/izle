import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        // Divider(
        //   thickness: 3,
        // ),
        // Container(
        //   child: Row(
        //     children: [
        //       SizedBox(width: 10),
        //       GestureDetector(
        //         onTap: () => Get.back(),
        //         child: RotatedBox(
        //           quarterTurns: 2,
        //           child: SvgPicture.asset(
        //             'assets/icons/next-icon.svg',
        //             height: 20,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.1,
        //       ),
        //       Text(
        //         'Редактировать объявления',
        //         style: FontStyles.boldStyle(
        //           fontSize: 24,
        //           fontFamily: 'Lato',
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // Divider(
        //   thickness: 3,
        // ),
      ],
    );
  }
}
