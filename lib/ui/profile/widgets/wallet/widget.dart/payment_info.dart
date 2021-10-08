import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class PaymentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalate.lightGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Пополнения счета',
                  style: FontStyles.boldStyle(
                    fontSize: 16,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '35 000,00 UZS',
                  style: FontStyles.boldStyle(
                    fontSize: 16,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
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
