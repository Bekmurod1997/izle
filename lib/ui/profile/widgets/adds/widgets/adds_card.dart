import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/profile/widgets/advertise.dart';

class AddsCard extends StatefulWidget {
  final int id;
  final String title;
  final String price;
  final String date;
  final String imageUrl;
  final int status;
  // final int activeAds;

  AddsCard({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.status,
    // required this.activeAds,
  });
  @override
  State<AddsCard> createState() => _AddsCardState();
}

class _AddsCardState extends State<AddsCard> {
  final MyAdsController myAdsController = Get.find<MyAdsController>();

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
                  // SizedBox(height: 8),
                  // Text(
                  //   'Ташкент, Ташкентская область, Юнусабадский район',
                  //   style: FontStyles.regularStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'Lato',
                  //     color: Color(0xff7f807F),
                  //   ),
                  // ),
                  // SizedBox(height: 3),
                  // Text(
                  //   'С 14 июля по 13 августа',
                  //   style: FontStyles.regularStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'Lato',
                  //     color: Color(0xff7f807F),
                  //   ),
                  // ),
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
                              'Рекламировать',
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
                            child: Text('Поднять на 300 сум',
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: value == 3
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Вы действительно хотите обнулить статистику?',
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
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/view.svg'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '123',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff7F807F),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/Vector.svg'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '15',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff7F807F),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/message_grey.svg'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '15',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff7F807F),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/call.svg'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '15',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff7F807F),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              60,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 12),
                                                      decoration: BoxDecoration(
                                                        color: ColorPalate
                                                            .mainColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Да, обнулить',
                                                          style: FontStyles
                                                              .regularStyle(
                                                            fontSize: 12,
                                                            fontFamily: 'Lato',
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              60,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .circular(
                                                            10.0,
                                                          ),
                                                          border: Border.all(
                                                            color: ColorPalate
                                                                .mainColor,
                                                            width: 2,
                                                          )),
                                                      child: Center(
                                                        child: Text(
                                                            'Нет, передумал(а)',
                                                            style: FontStyles
                                                                .regularStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: ColorPalate
                                                                        .mainColor)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30),
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Text(
                                                    'Закрыть',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Удалось ли продать товар?',
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
                                                          .deleteAd(widget.id);
                                                      Get.back();
                                                      myAdsController
                                                          .fetchMyOrders();
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
                                                          'ДА',
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
                                                          'НЕТ',
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
                                                    'Закрыть',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                      color: Color(0xff585555),
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                );
                              });
                        },
                        icon: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/icons/three_h.svg'),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text('Редактировать'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Деактировать'),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Обнулить статистику'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 13),
                ],
              ),
            ),
          )
        : Container();
  }
}
