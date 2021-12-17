import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_onmoderation_controller.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/moderation_card.dart';
import 'package:intl/date_symbol_data_local.dart';

class Moderation extends StatefulWidget {
  @override
  State<Moderation> createState() => _ModerationState();
}

class _ModerationState extends State<Moderation> {
  final MyAdsOnModerationController myAdsOnModerationController =
      Get.find<MyAdsOnModerationController>();
  final formatCurrency = NumberFormat.decimalPattern();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      myAdsOnModerationController.fetchMyOnModerationOrders();
      initializeDateFormatting();
      Intl.defaultLocale = 'ru_RU';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorPalate.mainPageColor,
        // appBar: customAppBar1(context, title: 'Неактивные'),
        body: Obx(() {
      if (myAdsOnModerationController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
          ),
        );
      } else {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Divider(
                thickness: 3,
              ),
              SizedBox(height: 3),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          'assets/icons/next-icon.svg',
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      'На модерации',
                      style: FontStyles.boldStyle(
                        fontSize: 24,
                        fontFamily: 'Lato',
                        color: Color(0xff4B4F5F),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Divider(
                thickness: 3,
              ),
              myAdsOnModerationController.allMyAdsList().data?.length == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                        Text(
                          'Пока, у вас нету объявления на модерации ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var giventDate = DateTime.parse(
                          myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .date!,
                        );
                        var format = DateFormat("MMMMEEEEd");
                        // int nonActiveAds = 0;
                        // int numberTotalAds =
                        //     myAdsController.allMyAdsList().mMeta?.pageCount ?? 0;
                        // for (var i = 0; i < numberTotalAds; i++) {
                        //   if (myAdsController.allMyAdsList().data![i].status == 0) {
                        //     setState(() {
                        //       nonActiveAds++;
                        //     });
                        //   }
                        // }
                        // print('111');
                        // print(numberTotalAds);
                        // print('number of ');
                        // print(nonActiveAds);
                        // print(numberTotalAds);
                        return ModerationCard(
                          // nonActiveAds: nonActiveAds,
                          gallery: myAdsOnModerationController
                              .allMyAdsList()
                              .data?[index]
                              .gallery,
                          categoryId: myAdsOnModerationController
                              .allMyAdsList()
                              .data?[index]
                              .categoryId,
                          type_ad: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .typeAd
                              .toString(),
                          category: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .categoryName!,
                          description: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .description!,
                          lat: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .lat!,
                          long: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .lng!,
                          email:
                              '${myAdsOnModerationController.allMyAdsList().data![index].user?.email}',
                          content: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .content!,
                          locationTitle: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .address!,
                          phoneNumber: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .phone!,
                          type:
                              '${myAdsOnModerationController.allMyAdsList().data![index].type}',
                          userName: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .user!
                              .name!,
                          status: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .status!,
                          id: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .id!,

                          title: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .title!,
                          date: format.format(giventDate),
                          imageUrl: myAdsOnModerationController
                              .allMyAdsList()
                              .data![index]
                              .photo!,
                          price: formatCurrency
                              .format(myAdsOnModerationController
                                  .allMyAdsList()
                                  .data![index]
                                  .price)
                              .replaceAll(',', ' ')
                              .toString(),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: myAdsOnModerationController
                              .allMyAdsList()
                              .data
                              ?.length ??
                          0,
                    )
            ],
          ),
        );
      }
    }));
  }
}

// class _ModerationState extends State<Moderation> {
//   final MyAdsOnModerationController myAdsOnModerationController =
//       Get.find<MyAdsOnModerationController>();
//   @override
//   void initState() {
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       myAdsOnModerationController.fetchMyOnModerationOrders();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: ColorPalate.mainPageColor,
//         // appBar: customAppBar1(context, title: 'Неактивные'),
//         body: SingleChildScrollView(
//       physics: ScrollPhysics(),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: 30),
//           Divider(
//             thickness: 3,
//           ),
//           SizedBox(height: 3),
//           Container(
//             child: Row(
//               children: [
//                 SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: RotatedBox(
//                     quarterTurns: 2,
//                     child: SvgPicture.asset(
//                       'assets/icons/next-icon.svg',
//                       height: 20,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.1,
//                 ),
//                 Text(
//                   'На модерации',
//                   style: FontStyles.boldStyle(
//                     fontSize: 24,
//                     fontFamily: 'Lato',
//                     color: Color(0xff4B4F5F),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 3),
//           Divider(
//             thickness: 3,
//           ),
//           Obx(() {
//             if (myAdsOnModerationController.isLoading.value) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor:
//                       AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
//                 ),
//               );
//             } else {
//               return myAdsOnModerationController.allMyAdsList().data?.length ==
//                       0
//                   ? Column(
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * .4,
//                         ),
//                         Text(
//                           'Пока, у вас нету объявления на модерации ',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     )
//                   : ListView.separated(
//                       padding: EdgeInsets.zero,
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         // int nonActiveAds = 0;
//                         // int numberTotalAds =
//                         //     myAdsController.allMyAdsList().mMeta?.pageCount ?? 0;
//                         // for (var i = 0; i < numberTotalAds; i++) {
//                         //   if (myAdsController.allMyAdsList().data![i].status == 0) {
//                         //     setState(() {
//                         //       nonActiveAds++;
//                         //     });
//                         //   }
//                         // }
//                         // print('111');
//                         // print(numberTotalAds);
//                         // print('number of ');
//                         // print(nonActiveAds);
//                         // print(numberTotalAds);
//                         return ModerationCard(
//                           // nonActiveAds: nonActiveAds,
//                           gallery: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data?[index]
//                               .gallery,
//                           category: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .categoryName!,
//                           description: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .description!,
//                           lat: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .lat!,
//                           long: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .lng!,
//                           email:
//                               '${myAdsOnModerationController.allMyAdsList().data![index].user?.email}',
//                           content: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .content!,
//                           locationTitle: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .address!,
//                           phoneNumber: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .phone!,
//                           type:
//                               '${myAdsOnModerationController.allMyAdsList().data![index].type}',
//                           userName: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .user!
//                               .name!,
//                           status: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .status!,
//                           id: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .id!,
//                           title: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .title!,
//                           date: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .date!,
//                           imageUrl: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .photo!,
//                           price: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data![index]
//                               .price
//                               .toString(),
//                         );
//                       },
//                       separatorBuilder: (context, index) => SizedBox(
//                         height: 10,
//                       ),
//                       itemCount: myAdsOnModerationController
//                               .allMyAdsList()
//                               .data
//                               ?.length ??
//                           0,
//                     );
//             }
//           })
//         ],
//       ),
//     ));
//   }
// }
