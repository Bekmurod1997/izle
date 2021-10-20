import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_controller.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/adds_card.dart';

class ActiveAdds extends StatefulWidget {
  @override
  State<ActiveAdds> createState() => _ActiveAddsState();
}

class _ActiveAddsState extends State<ActiveAdds> {
  final MyAdsController myAdsController = Get.find<MyAdsController>();
  @override
  void initState() {
    // AllServices.myOrders();
    // AllServices.listOfAllAds(1);

    myAdsController.fetchMyOrders();
    super.initState();
  }

  int activeAds = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        if (myAdsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
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
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AddsCard(
                      status:
                          myAdsController.allMyAdsList().data![index].status!,
                      id: myAdsController.allMyAdsList().data![index].id!,
                      title: myAdsController.allMyAdsList().data![index].title!,
                      date: myAdsController.allMyAdsList().data![index].date!,
                      imageUrl:
                          myAdsController.allMyAdsList().data![index].photo!,
                      price: myAdsController
                          .allMyAdsList()
                          .data![index]
                          .price
                          .toString(),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: myAdsController.allMyAdsList().data?.length ?? 0,
                )
              ],
            ),
          );
        }
      })),
    );
  }
}
