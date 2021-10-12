import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/author_ads_controller.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/ui/profile/widgets/adds/author_ads_card.dart';

class AdsByAuthor extends StatefulWidget {
  final String authorToken;
  final String userName;
  AdsByAuthor({required this.authorToken, required this.userName});
  @override
  _AdsByAuthorState createState() => _AdsByAuthorState();
}

class _AdsByAuthorState extends State<AdsByAuthor> {
  final AuthorAdsController adsController = Get.put(AuthorAdsController());
  @override
  void initState() {
    adsController.fetchAuthorOrders(widget.authorToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        if (adsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: FontStyles.semiBoldStyle(
                              fontSize: 24,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            'был(а) вчера 19:35',
                            style: FontStyles.semiBoldStyle(
                                fontSize: 12,
                                fontFamily: 'Lato',
                                color: Color(0xff616161)),
                          ),
                          SizedBox(height: 13),
                        ],
                      ),
                      SvgPicture.asset('assets/icons/user.svg'),
                    ],
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailScreen(
                                proId: adsController
                                    .allAuthorAdsList()
                                    .data![index]
                                    .id!));
                          },
                          child: AuthorAdsCard(
                              id: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .id!,
                              title: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .title!,
                              price: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .price
                                  .toString(),
                              date: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .date!,
                              imageUrl: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .photo!,
                              status: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .status!),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: adsController.allAuthorAdsList().data!.length)
              ],
            ),
          );
        }
      })),
    );
  }
}
