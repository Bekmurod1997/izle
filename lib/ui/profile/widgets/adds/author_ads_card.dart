import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AuthorAdsCard extends StatefulWidget {
  final int id;
  final String title;
  final String price;
  final String date;
  final String imageUrl;
  final int status;
  final int top;
  final int premium;

  bool isFavorite;

  AuthorAdsCard({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.status,
    required this.top,
    required this.premium,
    required this.isFavorite,
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
                        flex: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorPalate.addsBackgroundColor,
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                'http://izle.uz/' + widget.imageUrl,
                                fit: BoxFit.contain,
                              ),
                              widget.premium == 1 || widget.top == 1
                                  ? Positioned(
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: widget.premium == 1
                                              ? Color(0xffF7D501)
                                              : ColorPalate.mainColor,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                          ),
                                        ),
                                        child: Text(
                                            widget.premium == 1
                                                ? 'Премиум'
                                                : 'Топ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0)),
                                      ))
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontStyles.semiBoldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                widget.price + ' ' + 'sum'.tr,
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.isFavorite = !widget.isFavorite;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(widget.isFavorite
                                          ? 'addedToFavorites'.tr
                                          : 'deleteFromFavorites'.tr)));
                            });
                            AllServices.addAndRemoveFav(widget.id);
                          },
                          child: widget.isFavorite
                              ? SvgPicture.asset('assets/icons/star_active.svg')
                              : SvgPicture.asset(
                                  'assets/icons/star.svg',
                                  color: ColorPalate.mainColor,
                                ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 15),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           SvgPicture.asset('assets/icons/view.svg'),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             '123',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Color(0xff7F807F),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           SvgPicture.asset('assets/icons/star_grey.svg'),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             '15',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Color(0xff7F807F),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           SvgPicture.asset('assets/icons/message_grey.svg'),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             '15',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Color(0xff7F807F),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           SvgPicture.asset('assets/icons/call.svg'),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             '15',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Color(0xff7F807F),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // SizedBox(height: 15),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 0.00000001,
          );
  }
}
