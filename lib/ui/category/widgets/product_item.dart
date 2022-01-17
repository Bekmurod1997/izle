import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  bool isFavorite;
  String? imageUrl;
  String typeAd;

  String? cityName;
  String? title;
  String? price;
  String? date;
  final int top;
  final int premium;
  int id;

  ProductItem({
    required this.title,
    required this.price,
    required this.typeAd,
    required this.cityName,
    required this.imageUrl,
    required this.top,
    required this.premium,
    required this.date,
    required this.isFavorite,
    required this.id,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  String? day;
  String? month;

  String _dateChanger(String datee) {
    var parts = datee.split(',');
    setState(() {
      day = parts[0].trim();
      // monthh = parts[1].trim();
    });
    if (day!.contains('понедельник')) {
      setState(() {
        MyPref.lang == 'ru'
            ? day!
            : MyPref.lang == 'uz'
                ? day!.replaceAll('понедельник', 'dushanba')
                : day!.replaceAll('понедельник', 'dúyshembi');
      });
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('понедельник', 'dushanba')
              : day!.replaceAll('понедельник', 'dúyshembi');
    } else if (day!.contains('вторник')) {
      setState(() {
        MyPref.lang == 'ru'
            ? day!
            : MyPref.lang == 'uz'
                ? day!.replaceAll('вторник', 'seshanba')
                : day!.replaceAll('вторник', 'siyshembi');
      });
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('вторник', 'seshanba')
              : day!.replaceAll('вторник', 'siyshembi');
    } else if (day!.contains('среда')) {
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('среда', 'chorshanba')
              : day!.replaceAll('среда', 'sa\'rshembi');
    } else if (day!.contains('четверг')) {
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('четверг', 'payshanba')
              : day!.replaceAll('четверг', 'piyshembi');
    } else if (day!.contains('пятница')) {
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('пятница', 'juma')
              : day!.replaceAll('пятница', 'juma');
    } else if (day!.contains('суббота')) {
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('суббота', 'shanba')
              : day!.replaceAll('суббота', 'shembi');
    } else {
      return MyPref.lang == 'ru'
          ? day!
          : MyPref.lang == 'uz'
              ? day!.replaceAll('воскресенье', 'yakshanba')
              : day!.replaceAll('воскресенье', 'ekshembi');
    }
  }

  String monthChanger(String monthh) {
    var parts = monthh.split(',');
    setState(() {
      month = parts[1].trim();
      // monthh = parts[1].trim();
    });
    // setState(() {
    //   month = parts[1].trim();
    // });
    if (month!.contains('января')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('января', 'yanvar')
          : month!;
    } else if (month!.contains('февраля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('февраля', 'fevral')
          : month!;
    } else if (month!.contains('марта')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('марта', 'mart')
          : month!;
    } else if (month!.contains('апреля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('апреля', 'aprel')
          : month!;
    } else if (month!.contains('мая')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('мая', 'may')
          : month!;
    } else if (month!.contains('июня')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('июня', 'iyun')
          : month!;
    } else if (month!.contains('июля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('июля', 'iyul')
          : month!;
    } else if (month!.contains('августа')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('августа', 'avgust')
          : month!;
    } else if (month!.contains('сентября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('сентября', 'sentyabr')
          : month!;
    } else if (month!.contains('октября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('октября', 'oktyabr')
          : month!;
    } else if (month!.contains('ноября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('ноября', 'noyabr')
          : month!;
    }
    setState(() {});

    return MyPref.lang == 'uz' || MyPref.lang == 'kr'
        ? month!.replaceAll('декабря', 'dekabr')
        : month!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPalate.addsBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorPalate.addsBackgroundColor,
                ),
                child: Image.network(
                  'http://izle.uz/' + widget.imageUrl!,
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
                        widget.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontStyles.semiBoldStyle(
                            fontSize: 13,
                            fontFamily: 'Lato',
                            color: Colors.black),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('id');
                        print(widget.id);
                        setState(
                          () {
                            widget.isFavorite = !widget.isFavorite;
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text(widget.isFavorite
                                      ? 'addedToFavorites'.tr
                                      : 'deleteFromFavorites'.tr)));
                          },
                        );
                        AllServices.addAndRemoveFav(widget.id);
                      },
                      child: widget.isFavorite
                          ? SvgPicture.asset('assets/icons/star_active.svg')
                          : SvgPicture.asset(
                              'assets/icons/star.svg',
                              color: ColorPalate.mainColor,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // (widget.typeAd == 'negotiable') &&
                //         (widget.price != '0.0 сум' || widget.price != '0 сум')
                //     ? Text(
                //         widget.price == '0 сум' || widget.price == '0.0 сум'
                //             ? ''
                //             : widget.price!,
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
                  style: widget.typeAd == 'free' || widget.typeAd == 'exchange'
                      ? FontStyles.blackStyle(
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
                //   style: FontStyles.blackStyle(
                //       fontSize: 14, fontFamily: 'Lato', color: Colors.black87),
                // ),

                SizedBox(height: 14),
                Text(
                  widget.cityName!,
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                Text(
                  _dateChanger(widget.date!) +
                      ', ' +
                      monthChanger(widget.date!),
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
