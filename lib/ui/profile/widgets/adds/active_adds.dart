import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_active_controller.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/adds_card.dart';

class ActiveAdds extends StatefulWidget {
  @override
  State<ActiveAdds> createState() => _ActiveAddsState();
}

class _ActiveAddsState extends State<ActiveAdds> {
  final MyAdsActiveController myAdsActiveController =
      Get.find<MyAdsActiveController>();
  final formatCurrency = NumberFormat.decimalPattern();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      myAdsActiveController.fetchMyActiveOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (myAdsActiveController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
          ),
        );
      } else {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
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
                      onTap: () => Get.back(),
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
                      'Активные',
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
              myAdsActiveController.allMyAdsList().data?.length == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                        Text(
                          'Пока, у вас нету активнитных объявления',
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
                        return AddsCard(
                          premium: myAdsActiveController
                                  .allMyAdsList()
                                  .data![index]
                                  .premium ??
                              0,
                          top: myAdsActiveController
                                  .allMyAdsList()
                                  .data![index]
                                  .top ??
                              0,
                          category: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .categoryName!,
                          categoryId: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .categoryId!,
                          content: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .content!,
                          description: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .description!,

                          lat: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .lat!,
                          locationTitle: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .address!,
                          long: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .lng!,
                          phoneNumber: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .phone!,
                          userName: myAdsActiveController
                                  .allMyAdsList()
                                  .data![index]
                                  .user!
                                  .name ??
                              '',

                          favorites: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .favorites!,
                          imageGallery: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .gallery!,
                          type_ad: myAdsActiveController
                                  .allMyAdsList()
                                  .data![index]
                                  .typeAd ??
                              'price',
                          messages: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .messages!,
                          phoneViews: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .viewPhone!,
                          views: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .views!,
                          // activeAds: activeAds,
                          status: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .status!,
                          id: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .id!,
                          title: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .title!,
                          date: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .date!,
                          imageUrl: myAdsActiveController
                              .allMyAdsList()
                              .data![index]
                              .photo!,
                          price: formatCurrency
                              .format(myAdsActiveController
                                  .allMyAdsList()
                                  .data![index]
                                  .price)
                              .replaceAll(',', '')
                              .toString(),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount:
                          myAdsActiveController.allMyAdsList().data?.length ??
                              0,
                    )
            ],
          ),
        );
      }
    }));
  }
}
