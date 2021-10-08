import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class NonActiveAddsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPalate.addsBackgroundColor,
                    ),
                    child: Image.asset(
                      'assets/images/clothes.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Платье для девочки.Турция',
                          style: FontStyles.semiBoldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '190 000 сум',
                          style: FontStyles.boldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'С 14 июля по 13 августа',
                          style: FontStyles.regularStyle(
                            fontSize: 12,
                            fontFamily: 'Lato',
                            color: Color(0xff7f807F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/view.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '123',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7F807F),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Vector.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7F807F),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/message_grey.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7F807F),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: ColorPalate.mainColor,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Активировать',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(
                          10.0,
                        ),
                        border: Border.all(
                          color: ColorPalate.mainColor,
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Редактировать',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorPalate.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
