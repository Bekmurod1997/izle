import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';

// ignore: must_be_immutable
class RecommandationItem extends StatefulWidget {
  bool isFavorite;
  final String title;
  final String typeAd;
  final String price;
  final String city;
  final String date;
  final String imageUrl;
  final int id;
  final int top;
  final int premium;
  RecommandationItem({
    required this.isFavorite,
    required this.title,
    required this.typeAd,
    required this.price,
    required this.date,
    required this.top,
    required this.premium,
    required this.city,
    required this.imageUrl,
    required this.id,
  });

  @override
  _RecommandationItemState createState() => _RecommandationItemState();
}

class _RecommandationItemState extends State<RecommandationItem> {
  Set<int> favoriteIndex = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPalate.addsBackgroundColor),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.152,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorPalate.addsBackgroundColor,
                ),
                child: Image.network(
                  'http://izle.uz/' + widget.imageUrl,
                  // 'assets/images/clothes.png',
                  fit: BoxFit.cover,
                ),
              ),
              widget.premium == 1 || widget.top == 1
                  ? Positioned(
                      right: 0,
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
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Text(widget.premium == 1 ? 'Премиум' : 'Топ',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0)),
                      ))
                  : Container(),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontStyles.semiBoldStyle(
                            fontSize: 13,
                            fontFamily: 'Lato',
                            color: Colors.black),
                        // textAlign: TextAlign.center,
                      ),
                    ),

                    /// this is to add favoritee////////
                    /// ///////////////////////////
                    /// ///////////////////

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isFavorite = !widget.isFavorite;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(widget.isFavorite
                                  ? "Добавлено в список избранных"
                                  : "Удалено в список избранных")));
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

                    /// this is to add favoritee////////
                    /// ///////////////////////////
                    /// ///////////////////
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // (widget.typeAd == 'negotiable') &&
                      //         (widget.price != '0.0 сум' ||
                      //             widget.price != '0 сум')
                      //     ? Text(
                      //         widget.price == '0 сум' ||
                      //                 widget.price == '0.0 сум'
                      //             ? ''
                      //             : widget.price,
                      //         style: TextStyle(
                      //           fontSize: widget.price == '0 сум' ||
                      //                   widget.price == '0.0 сум'
                      //               ? 0
                      //               : 14,
                      //         ),
                      //       )
                      //     : Text(
                      //         '',
                      //         style: TextStyle(fontSize: 0),
                      //       ),

                      Text(
                        widget.typeAd == 'free'
                            ? 'бесплатно'
                            : widget.typeAd == 'exchange'
                                ? 'обмен'
                                : '${widget.price}',
                        style: widget.typeAd == 'free' ||
                                widget.typeAd == 'exchange'
                            ? FontStyles.boldStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                color: Colors.black87)
                            : FontStyles.mediumStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                color: Colors.black87),
                      ),
                      // Text(
                      //   widget.typeAd == 'free'
                      //       ? 'бесплатно'
                      //       : widget.typeAd == 'negotiable'
                      //           ? 'договорная'
                      //           : widget.typeAd == 'exchange'
                      //               ? 'обмен'
                      //               : '${widget.price}',
                      //   style: FontStyles.mediumStyle(
                      //       fontSize: 14,
                      //       fontFamily: 'Lato',
                      //       color: Colors.black87),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  widget.city,
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.date,
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
