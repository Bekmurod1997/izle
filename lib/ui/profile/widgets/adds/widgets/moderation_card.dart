import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/edit_product/edit_product_screen.dart';
import 'package:izle/utils/my_prefs.dart';

class ModerationCard extends StatefulWidget {
  final List<String>? gallery;
  final int? categoryId;
  final int id;
  final String type_ad;
  final String title;
  final String imageUrl;
  final String category;
  final String description;
  final String type;
  final String locationTitle;
  final String userName;
  final String email;
  final int price;
  final String phoneNumber;
  final String date;
  final String content;
  final int status;
  final String lat;
  final String long;
  final String address;
  final String cityId;
  final String cityName;
  // final int nonActiveAds;

  ModerationCard({
    required this.id,
    required this.address,
    required this.type_ad,
    required this.categoryId,
    required this.gallery,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.email,
    required this.imageUrl,
    required this.locationTitle,
    required this.phoneNumber,
    required this.type,
    required this.content,
    required this.userName,
    required this.date,
    required this.status,
    required this.cityId,
    required this.cityName,
    required this.lat,
    required this.long,
    // required this.nonActiveAds,
  });

  @override
  State<ModerationCard> createState() => _ModerationCardState();
}

class _ModerationCardState extends State<ModerationCard> {
  final formatCurrency = NumberFormat.decimalPattern();
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
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPalate.addsBackgroundColor,
                    ),
                    child: Image.network(
                      'http://izle.uz/' + widget.imageUrl,
                      fit: BoxFit.contain,
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
                          widget.title,
                          style: FontStyles.semiBoldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.type_ad == 'price'
                              ? '${formatCurrency.format(widget.price).replaceAll(',', ' ')} ' +
                                  'sum'.tr
                              : widget.type_ad == 'exchange'
                                  ? 'exchange'.tr
                                  : widget.type_ad == 'negotiable'
                                      ? 'negotiable'.tr
                                      : 'free'.tr,
                          style: FontStyles.boldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3),
                        Text(
                          // 'С 14 июля по 13 августа',
                          _dateChanger(widget.date) +
                              ', ' +
                              monthChanger(widget.date),
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => EditProductSceen(
                          cityId: widget.cityId,
                          cityName: widget.cityName,
                          categoryId: widget.categoryId,
                          // lat: lat,
                          // long: long,
                          dateTime: widget.date,
                          adderss: widget.address,
                          imageGallry: widget.gallery,
                          type_ad: widget.type_ad,
                          id: widget.id,
                          category: widget.category,
                          description: widget.description,
                          email: widget.email,
                          imageUrl: widget.imageUrl,
                          // locationTitle: locationTitle,
                          phoneNumber: widget.phoneNumber,
                          price: widget.price.toString(),
                          title: widget.title,
                          type: widget.type,
                          userName: widget.userName,
                          content: widget.content,
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1 - 40,
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
                        'edit'.tr,
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
            // Text(type_ad),
            // Text(categoryId.toString()),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
