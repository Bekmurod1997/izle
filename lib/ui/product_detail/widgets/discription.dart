import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';

class ProductDesciption extends StatelessWidget {
  final String proDesc;
  ProductDesciption({required this.proDesc});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'desctiption'.tr,
            style: FontStyles.semiBoldStyle(
              fontSize: 18,
              fontFamily: 'Lato',
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            // 'Красивое платье, фирменное. Пости новое. На размер 7-8 лет.',
            proDesc,
            style: FontStyles.regularStyle(
              fontSize: 14,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ],
    );
  }
}
