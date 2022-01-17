import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_active_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/edit_product/edit_product_screen.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/ui/profile/widgets/advertise.dart';
import 'package:izle/utils/my_prefs.dart';

class AddsCard extends StatefulWidget {
  final List<String> imageGallery;
  final int? categoryId;
  final int id;
  final String type_ad;
  final String title;
  final String imageUrl;
  final String category;
  final String description;
  final String locationTitle;
  final String userName;
  final String price;
  final String phoneNumber;
  final String date;
  final String content;
  final int favorites;
  final int views;
  final int phoneViews;
  final int messages;
  final String lat;
  final String long;
  final int status;
  final int top;
  final int premium;
  // final int activeAds;

  AddsCard({
    required this.id,
    required this.imageGallery,
    required this.category,
    required this.categoryId,
    required this.content,
    required this.description,
    required this.date,
    required this.lat,
    required this.long,
    required this.phoneNumber,
    required this.title,
    required this.favorites,
    required this.locationTitle,
    required this.userName,
    required this.type_ad,
    required this.views,
    required this.phoneViews,
    required this.messages,
    required this.price,
    required this.imageUrl,
    required this.status,
    required this.top,
    required this.premium,
    // required this.activeAds,
  });
  @override
  State<AddsCard> createState() => _AddsCardState();
}

class _AddsCardState extends State<AddsCard> {
  final MyAdsActiveController myAdsActiveController =
      Get.find<MyAdsActiveController>();
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
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(proId: widget.id)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                        'http://izle.uz/' + widget.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Container(
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
                                widget.type_ad == 'price'
                                    ? '${widget.price} ' + 'sum'.tr
                                    : widget.type_ad == 'exchange'
                                        ? 'exchange'.tr
                                        : widget.type_ad == 'negotiable'
                                            ? 'negotiable'.tr
                                            : 'free'.tr,
                                // '${widget.price} + сум',
                                // '190 000 сум',
                                style: FontStyles.boldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                _dateChanger(widget.date) +
                                    ', ' +
                                    monthChanger(widget.date),
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
                                  child: Text(
                                      widget.premium == 1 ? 'Премиум' : 'Топ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0)),
                                ))
                            : Container(),
                      ],
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
                          widget.views.toString(),
                          // '123',
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
                          widget.favorites.toString(),
                          // '15',
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
                          widget.messages.toString(),
                          // '15',
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
                          widget.phoneViews.toString(),
                          // '15',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => Advertise()),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 60,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: ColorPalate.mainColor,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'toAdvertise'.tr,
                          style: FontStyles.regularStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 60,
                      padding: const EdgeInsets.symmetric(vertical: 6),
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
                        child: Text('raiseBy300Sum'.tr + 'sum'.tr,
                            style: FontStyles.regularStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                color: ColorPalate.mainColor)),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      print('tabebed' + value.toString());
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: value == 2
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Center(
                                              child: Text(
                                                'couldYouSell'.tr,
                                                style: FontStyles.boldStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Lato'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await AllServices.deleteAd(
                                                        widget.id);
                                                    Get.back();
                                                    myAdsActiveController
                                                        .fetchMyActiveOrders();
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: ColorPalate
                                                            .mainColor,
                                                        width: 5,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'yes'.tr,
                                                        style: FontStyles
                                                            .boldStyle(
                                                                fontSize: 25,
                                                                fontFamily:
                                                                    'Lato'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffD7143A),
                                                        width: 5,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'no'.tr,
                                                        style: FontStyles
                                                            .boldStyle(
                                                                fontSize: 25,
                                                                fontFamily:
                                                                    'Lato'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Center(
                                              child: GestureDetector(
                                                onTap: () => Get.back(),
                                                child: Text(
                                                  'close'.tr,
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color: Color(0xff585555),
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : value == 1
                                          ? Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'deactivate'.tr + '?',
                                                    style: FontStyles.boldStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Lato'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await AllServices
                                                            .deactivateStatus(
                                                                adId: widget.id
                                                                    .toString());
                                                        Get.back();
                                                        myAdsActiveController
                                                            .fetchMyActiveOrders();
                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: ColorPalate
                                                                .mainColor,
                                                            width: 5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'yes'.tr,
                                                            style: FontStyles
                                                                .boldStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontFamily:
                                                                        'Lato'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => Get.back(),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xffD7143A),
                                                            width: 5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'no'.tr,
                                                            style: FontStyles
                                                                .boldStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontFamily:
                                                                        'Lato'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Center(
                                                  child: GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Text(
                                                      'close'.tr,
                                                      style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff585555),
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'deactivate'.tr,
                                                    style: FontStyles.boldStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Lato'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        Get.to(() =>
                                                            EditProductSceen(
                                                              category: widget
                                                                  .category,
                                                              categoryId: widget
                                                                  .categoryId,
                                                              content: widget
                                                                  .content,
                                                              dateTime:
                                                                  widget.date,
                                                              description: widget
                                                                  .description,
                                                              id: widget.id,
                                                              imageGallry: widget
                                                                  .imageGallery,
                                                              // lat: widget.lat,
                                                              // long: widget.long,
                                                              phoneNumber: widget
                                                                  .phoneNumber,
                                                              price:
                                                                  widget.price,
                                                              type_ad: widget
                                                                  .type_ad,
                                                              title:
                                                                  widget.title,
                                                              userName: widget
                                                                  .userName,
                                                              // locationTitle: widget
                                                              //     .locationTitle,
                                                            ));
                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: ColorPalate
                                                                .mainColor,
                                                            width: 5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'yes'.tr,
                                                            style: FontStyles
                                                                .boldStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontFamily:
                                                                        'Lato'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => Get.back(),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xffD7143A),
                                                            width: 5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'no'.tr,
                                                            style: FontStyles
                                                                .boldStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontFamily:
                                                                        'Lato'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Center(
                                                  child: GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Text(
                                                      'close'.tr,
                                                      style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff585555),
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                            );
                          });
                    },
                    icon: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/three_h.svg'),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {},
                        value: 1,
                        child: Text('deactivate'.tr),
                      ),
                      PopupMenuItem(
                        onTap: () => print('pressed edit'),
                        value: 3,
                        child: Text('edit'.tr),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('delete'.tr),
                      ),

                      // PopupMenuItem(
                      //   value: 3,
                      //   child: Text('Обнулить статистику'),
                      // ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 13),
            ],
          ),
        ),
      ),
    );
  }
}
