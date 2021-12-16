import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_active_controller.dart';
import 'package:izle/controller/my_ads_inactive_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/edit_product/edit_product_screen.dart';

class InActiveCard extends StatefulWidget {
  final List<String>? gallery;
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
  final String price;
  final String phoneNumber;
  final String date;
  final String content;
  final int status;
  final String lat;
  final String long;
  // final int nonActiveAds;

  InActiveCard({
    required this.id,
    required this.gallery,
    required this.title,
    required this.type_ad,
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
    required this.lat,
    required this.long,
    // required this.nonActiveAds,
  });

  @override
  State<InActiveCard> createState() => _InActiveCardState();
}

class _InActiveCardState extends State<InActiveCard> {
  final MyAdsInActiveController myAdsInActiveController =
      Get.find<MyAdsInActiveController>();
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
                          '${widget.price} сум',
                          style: FontStyles.boldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3),
                        Text(
                          // 'С 14 июля по 13 августа',
                          widget.date,
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Row(
            //       children: [
            //         SvgPicture.asset('assets/icons/view.svg'),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           '123',
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Color(0xff7F807F),
            //           ),
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         SvgPicture.asset('assets/icons/Vector.svg'),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           '15',
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Color(0xff7F807F),
            //           ),
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         SvgPicture.asset('assets/icons/message_grey.svg'),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           '15',
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Color(0xff7F807F),
            //           ),
            //         )
            //       ],
            //     ),
            //   ],
            // ),

            // SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     width: MediaQuery.of(context).size.width / 2 - 40,
                //     padding: const EdgeInsets.symmetric(vertical: 8),
                //     decoration: BoxDecoration(
                //       color: ColorPalate.mainColor,
                //       borderRadius: new BorderRadius.circular(10.0),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Активировать',
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      'Активировать товар?',
                                      style: FontStyles.boldStyle(
                                          fontSize: 20, fontFamily: 'Lato'),
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
                                          await AllServices.activateStatus(
                                              adId: widget.id.toString());
                                          Get.back();
                                          myAdsInActiveController
                                              .fetchMyInActiveOrders();
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorPalate.mainColor,
                                              width: 5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'ДА',
                                              style: FontStyles.boldStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'Lato'),
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
                                              color: Color(0xffD7143A),
                                              width: 5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'НЕТ',
                                              style: FontStyles.boldStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'Lato'),
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
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Color(0xff585555),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                    // Get.to(() => EditProductSceen(
                    //       type_ad: type_ad,
                    //       imageGallry: gallery,
                    //       id: id,
                    //       category: category,
                    //       description: description,
                    //       email: email,
                    //       imageUrl: imageUrl,
                    //       locationTitle: locationTitle,
                    //       phoneNumber: phoneNumber,
                    //       price: price,
                    //       title: title,
                    //       type: type,
                    //       userName: userName,
                    //       content: content,
                    //     ));
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
                        'Активировать',
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
