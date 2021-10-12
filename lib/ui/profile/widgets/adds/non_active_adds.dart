import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/my_ads_controller.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/non_active_adds_card.dart';

class NonActiveAdds extends StatefulWidget {
  @override
  State<NonActiveAdds> createState() => _NonActiveAddsState();
}

class _NonActiveAddsState extends State<NonActiveAdds> {
  final MyAdsController myAdsController = Get.find<MyAdsController>();
  @override
  void initState() {
    myAdsController.fetchMyOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: ColorPalate.mainPageColor,
          // appBar: customAppBar1(context, title: 'Неактивные'),
          body: SingleChildScrollView(
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
                    'Неактивные',
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
            Obx(() {
              if (myAdsController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NonActiveAddsCard(
                    category: myAdsController
                        .allMyAdsList()
                        .data![index]
                        .categoryName!,
                    description: myAdsController
                        .allMyAdsList()
                        .data![index]
                        .description!,
                    email:
                        '${myAdsController.allMyAdsList().data![index].user?.email}',
                    content:
                        myAdsController.allMyAdsList().data![index].content!,
                    locationTitle:
                        myAdsController.allMyAdsList().data![index].address!,
                    phoneNumber:
                        myAdsController.allMyAdsList().data![index].phone!,
                    type: '${myAdsController.allMyAdsList().data![index].type}',
                    userName:
                        myAdsController.allMyAdsList().data![index].user!.name!,
                    status: myAdsController.allMyAdsList().data![index].status!,
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
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: myAdsController.allMyAdsList().data!.length,
                );
              }
            })
          ],
        ),
      )),
    );
  }
}
