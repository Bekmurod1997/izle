import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/author_ads_controller.dart';
import 'package:izle/ui/auth/auth_screen.dart';
import 'package:izle/ui/message/widgets/first_message.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/ui/profile/widgets/adds/author_ads_card.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsByAuthor extends StatefulWidget {
  final String? authorToken;
  final String? userName;
  final int? userId;
  final String? userPhone;
  final String? userImage;
  AdsByAuthor({
    this.authorToken,
    this.userName,
    this.userId,
    this.userPhone,
    this.userImage,
  });
  @override
  _AdsByAuthorState createState() => _AdsByAuthorState();
}

class _AdsByAuthorState extends State<AdsByAuthor> {
  final AuthorAdsController adsController = Get.put(AuthorAdsController());
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    adsController.fetchAuthorOrders(userId: widget.userId);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // allAdsController.currentPage++;
        // allAdsController.fetchAllAds();

        if (adsController.currentPage <
            adsController.allAuthorAdsList().mMeta!.pageCount!) {
          adsController.currentPage++;
          adsController.fetchAuthorOrders(userId: widget.userId);
        } else {
          print('nothing to scroll');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (adsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
          ),
        );
      } else {
        return ListView(
          controller: _scrollController,

          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 4,
            ),
            // SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/user.svg'),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName ?? 'user',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 24,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('tel: +${widget.userPhone}');
                          },
                          child: SvgPicture.asset(
                            'assets/images/call.svg',
                          ),
                        ),
                        SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => MyPref.token == ''
                                ? AuthScreen()
                                : FirstMessageScreen(
                                    imageUrl: widget.userImage,
                                    userId: widget.userId,
                                    userName: widget.userName,
                                    userPhone: widget.userPhone,
                                  ));
                          },
                          child: SvgPicture.asset(
                            'assets/images/sms.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 4,
            ),

            ListView.separated(
                shrinkWrap: true,
                // controller: _scrollController,
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
                          id: adsController.allAuthorAdsList().data![index].id!,
                          title: adsController
                              .allAuthorAdsList()
                              .data![index]
                              .title!,
                          premium: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .premium ??
                              0,
                          top: adsController
                                  .allAuthorAdsList()
                                  .data![index]
                                  .top ??
                              0,
                          price: adsController
                              .allAuthorAdsList()
                              .data![index]
                              .price
                              .toString(),
                          isFavorite: false,
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
                      height: 1,
                    ),
                itemCount: adsController.allAuthorAdsList().data!.length)
          ],
        );
      }
    }));
  }
}
