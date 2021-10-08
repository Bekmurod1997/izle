import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class Advertise extends StatelessWidget {
  const Advertise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(
        context,
        title: 'Рекламировать',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 75),
            child: Text(
              'Платье для девочки. Турция',
              style: FontStyles.mediumStyle(
                fontSize: 18,
                fontFamily: 'Lato',
              ),
            ),
          ),
          Container(
            height: 400,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(left: 50),
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 15, right: 40, left: 40, bottom: 30),
                            child: Text(
                              'Быстрая продажа',
                              textAlign: TextAlign.center,
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                                undeline: true,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/ad_g.svg',
                            height: 80,
                          ),
                          SizedBox(height: 12),
                          Text(
                            '14 000 сум',
                            style: FontStyles.boldStyle(
                              fontSize: 20,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            '16х больше просмотров',
                            style: FontStyles.regularStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              color: ColorPalate.mainColor,
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Топ объявление на 7 дней',
                                  style: FontStyles.regularStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/check.svg',
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '3 поднятие вверх списка',
                                  style: FontStyles.regularStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                SvgPicture.asset('assets/icons/check.svg')
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Vip-объявление',
                                  style: FontStyles.regularStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                SvgPicture.asset('assets/icons/check.svg')
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8),
                            decoration: BoxDecoration(
                              color: ColorPalate.mainColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Выбрать',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 1,
                    ),
                itemCount: 10),
          ),
          SizedBox(height: 90),

          SizedBox(height: 50),
          // SizedBox(height: 30),
        ],
      ),
    );
  }
}
