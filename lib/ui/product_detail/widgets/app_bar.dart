import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/ui/product_detail/widgets/more_vertical.dart';

PreferredSize detailAppBar() {
  return PreferredSize(
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: RotatedBox(
            quarterTurns: 2,
            child: SvgPicture.asset(
              'assets/icons/next-icon.svg',
              height: 20,
            ),
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          MoreVertical(),
        ],
      ),
      preferredSize: Size.fromHeight(40));
}
