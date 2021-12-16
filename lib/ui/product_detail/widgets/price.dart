import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

Widget price({required String price, required String typeAd}) {
  return Text(
    typeAd == 'free'
        ? 'бесплатно'
        : typeAd == 'negotiable'
            ? 'договорная'
            : typeAd == 'exchange'
                ? 'обмен'
                : '$price',
    // typeAd == 'price'
    //     ? '$price'
    //     : typeAd == 'free'
    //         ? 'бесплатно'
    //         : typeAd == 'negotiable'
    //             ? 'договорная'
    //             : 'обмен',

    style:
        FontStyles.blackStyle(fontSize: 20, fontFamily: 'Lato', letterSpace: 2),
  );
}
