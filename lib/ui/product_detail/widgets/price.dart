import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';

Widget price({required String price, required String typeAd}) {
  print('dsfsdf');
  print(price);
  print('sss');
  print(typeAd);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        (typeAd == 'negotiable' || typeAd == 'exchange' || typeAd == 'free') &&
                (price == '0.0 сум ' || price == '0 сум ')
            ? ''
            : '${price}',
        style: (typeAd == 'negotiable' ||
                    typeAd == 'exchange' ||
                    typeAd == 'free') &&
                (price == '0.0 сум ' || price == '0 сум ')
            ? TextStyle(fontSize: 0)
            : FontStyles.blackStyle(
                fontSize: (typeAd == 'negotiable' ||
                            typeAd == 'exchange' ||
                            typeAd == 'free') &&
                        price == '0.0'
                    ? 0
                    : 20,
                fontFamily: 'Lato',
                letterSpace: 2),
      ),
      Text(
        typeAd == 'free'
            ? 'free'.tr
            : typeAd == 'negotiable'
                ? 'negotiable'.tr
                : typeAd == 'exchange'
                    ? 'exchange'.tr
                    : typeAd == 'договорная' && price != '0.0'
                        ? '$price'
                        : '',
        style:
            typeAd == 'negotiable' || typeAd == 'exchange' || typeAd == 'free'
                ? FontStyles.mediumStyle(fontSize: 20, fontFamily: 'Lato')
                : FontStyles.blackStyle(
                    fontSize: 0, fontFamily: 'Lato', letterSpace: 2),
      ),
    ],
  );
}
