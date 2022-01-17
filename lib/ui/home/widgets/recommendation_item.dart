import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/all_regions_controller.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/services/all_services.dart';
import 'package:get/get.dart';
import 'package:izle/utils/my_prefs.dart';

// ignore: must_be_immutable
class RecommandationItem extends StatefulWidget {
  bool isFavorite;
  final int? cityId;
  final String title;
  final String typeAd;
  final String price;
  final String city;
  final String date;
  final String imageUrl;
  final int id;
  final int top;
  final int premium;
  // final List<DataRegions> cityList;
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
    required this.cityId,
    // required this.cityList,
  });

  @override
  _RecommandationItemState createState() => _RecommandationItemState();
}

class _RecommandationItemState extends State<RecommandationItem> {
  AllRegionsController allRegionsController = Get.find<AllRegionsController>();

  Set<int> favoriteIndex = Set<int>();
  String? day;
  String? month;
  DataRegions? aaa;

  void fetchingCityName() {
    // allRegionsController.fetchAllRegions();
    print('sdfsdfsdfsdf');
    // print(allRegionsController.allRegionsList.length);
    // setState(() {
    //   aaa = allRegionsController.allRegionsList
    //       .firstWhere((element) => element.id == widget.cityId);
    // });
  }

  String _dateChanger(String datee) {
    var parts = datee.split(',');
    setState(() {
      day = parts[0].trim();
      // monthh = parts[1].trim();
    });
    if (day!.contains('понедельник')) {
      setState(() {
        MyPref.lang == 'uz'
            ? day!.replaceAll('понедельник', 'dushanba')
            : MyPref.lang == 'kr'
                ? day!.replaceAll('понедельник', 'dúyshembi')
                : day!;
      });
      return MyPref.lang == 'uz'
          ? day!.replaceAll('понедельник', 'dushanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('понедельник', 'dúyshembi')
              : day!;
    } else if (day!.contains('вторник')) {
      setState(() {
        MyPref.lang == 'uz'
            ? day!.replaceAll('вторник', 'seshanba')
            : MyPref.lang == 'kr'
                ? day!.replaceAll('вторник', 'siyshembi')
                : day!;
      });
      return MyPref.lang == 'uz'
          ? day!.replaceAll('вторник', 'seshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('вторник', 'siyshembi')
              : day!;
    } else if (day!.contains('среда')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('среда', 'chorshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('среда', 'sa\'rshembi')
              : day!;
    } else if (day!.contains('четверг')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('четверг', 'payshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('четверг', 'piyshembi')
              : day!;
    } else if (day!.contains('пятница')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('пятница', 'juma')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('пятница', 'juma')
              : day!;
    } else if (day!.contains('суббота')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('суббота', 'shanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('суббота', 'shembi')
              : day!;
    } else {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('воскресенье', 'yakshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('воскресенье', 'ekshembi')
              : day!;
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
    // print('sdfsdfsd: ${aaa!.nameRu}');
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
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
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
                            ? 'free'.tr
                            : widget.typeAd == 'exchange'
                                ? 'exchange'.tr
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
                  _dateChanger(widget.date) + ', ' + monthChanger(widget.date),
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // Text(aaa!.nameRu.toString()),
                // Text(month!),

                // Text(monthChanger(widget.date))
                // Text(_dateChanger(widget.date))
                // Text(
                //   widget.date.replaceAll('четверг', 'payshanba'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
