import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class PaymentTill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: ColorPalate.lightGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top-объявления',
                style: FontStyles.boldStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
              Text(
                '-35 000,00 UZS',
                style: FontStyles.boldStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            'Действует до 01.08.21',
            style: FontStyles.boldStyle(
              fontSize: 12,
              fontFamily: 'Lato',
              color: Colors.white,
            ),
          ),
          Text(
            'Платье для девочки. Турция',
            style: FontStyles.boldStyle(
              fontSize: 16,
              fontFamily: 'Lato',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Операция: 123456789',
                style: FontStyles.boldStyle(
                  fontSize: 10,
                  fontFamily: 'Lato',
                  color: Colors.white70,
                ),
              ),
              Text(
                '25 август',
                style: FontStyles.boldStyle(
                  fontSize: 10,
                  fontFamily: 'Lato',
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
