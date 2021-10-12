import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class AuthorAdsCard extends StatefulWidget {
  final int id;
  final String title;
  final String price;
  final String date;
  final String imageUrl;
  final int status;

  AuthorAdsCard({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.status,
  });
  @override
  State<AuthorAdsCard> createState() => _AuthorAdsCardState();
}

class _AuthorAdsCardState extends State<AuthorAdsCard> {
  @override
  Widget build(BuildContext context) {
    return widget.status == 1
        ? Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorPalate.addsBackgroundColor,
                          ),
                          child: Image.network(
                            'http://izle.selfieshop.uz/' + widget.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 10, top: 0, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                // 'Платье для девочки.Турция',
                                widget.title,
                                style: FontStyles.semiBoldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                widget.price + 'сум',
                                // '190 000 сум',
                                style: FontStyles.boldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget.date,
                                // 'С 14 июля по 13 августа',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SvgPicture.asset('assets/icons/star_grey.svg'),
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
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/call.svg'),
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
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 0.00000001,
          );
    ;
  }
}
