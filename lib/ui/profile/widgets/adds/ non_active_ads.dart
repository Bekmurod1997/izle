import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_inactive_controller.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/in_active_ads_cart.dart';

class NonActiveAdsScreen extends StatefulWidget {
  const NonActiveAdsScreen({Key? key}) : super(key: key);

  @override
  State<NonActiveAdsScreen> createState() => _NonActiveAdsScreenState();
}

class _NonActiveAdsScreenState extends State<NonActiveAdsScreen> {
  final MyAdsInActiveController myAdsInActiveController =
      Get.find<MyAdsInActiveController>();
  final formatCurrency = NumberFormat.decimalPattern();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      myAdsInActiveController.fetchMyInActiveOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (myAdsInActiveController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorPalate.mainColor,
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
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
                      'Неактивные ',
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
              myAdsInActiveController.allMyAdsList().data?.length == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                        Text(
                          'Пока, у вас нету неактивных объявления',
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
                        return InActiveCard(
                          gallery: myAdsInActiveController
                              .allMyAdsList()
                              .data?[index]
                              .gallery,
                          type_ad: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .typeAd
                              .toString(),
                          category: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .categoryName!,
                          description: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .description!,
                          lat: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .lat!,
                          long: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .lng!,
                          email:
                              '${myAdsInActiveController.allMyAdsList().data![index].user?.email}',
                          content: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .content!,
                          locationTitle: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .address!,
                          phoneNumber: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .phone!,
                          type:
                              '${myAdsInActiveController.allMyAdsList().data![index].type}',
                          userName: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .user!
                              .name!,
                          status: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .status!,
                          id: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .id!,
                          title: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .title!,
                          date: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .date!,
                          imageUrl: myAdsInActiveController
                              .allMyAdsList()
                              .data![index]
                              .photo!,
                          price: formatCurrency
                              .format(myAdsInActiveController
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
                      itemCount:
                          myAdsInActiveController.allMyAdsList().data?.length ??
                              0,
                    )
            ],
          ),
        );
      }
    }));
  }
}
