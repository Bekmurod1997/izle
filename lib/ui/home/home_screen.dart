import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/home/widgets/search.dart';
import 'package:get/get.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AllAdsController adsController = Get.find<AllAdsController>();
  final SearchController searchController = Get.put(SearchController());
  ScrollController _scrollController = ScrollController();
  final formatCurrency = NumberFormat.decimalPattern();

  @override
  void initState() {
    adsController.currentPagePremium = 1;
    adsController.currentPageTop = 1;
    // Firebase.initializeApp();
    adsController.fetchAllAds();
    adsController.fetchAllPremiumAds();
    adsController.fetchAllTopAds();
    // configureFCM();
    print('my token');
    print(MyPref.token);
    print('home init state');

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        adsController.loadMore();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (adsController.isLoading.value &&
          adsController.isLoading2.value &&
          adsController.isLoading3.value &&
          !adsController.isLoadMore.value &&
          !adsController.isLoadMore3.value &&
          !adsController.isLoadMore2.value) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorPalate.mainColor,
          ),
        );
      } else {
        // List<Data> myCombinetList =
        //     adsController.adsList2 + adsController.adsList;
        return ListView(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          children: [
            Search(),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.only(left: 15, top: 5, bottom: 10),
            //       child: Text(
            //         'Премиум объявление',
            //         style: FontStyles.boldStyle(
            //           fontSize: 18,
            //           fontFamily: 'Lato',
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
            //       child: GridView.builder(
            //         padding: EdgeInsets.zero,
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: adsController.adsListPremium.length,
            //         gridDelegate:
            //             SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 5,
            //           mainAxisSpacing: 15,
            //           height: MediaQuery.of(context).size.height * 0.34,
            //         ),
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () => Get.to(() => ProductDetailScreen(
            //                 currencySort: '',
            //                 proId: adsController.adsListPremium[index].id)),
            //             child: RecommandationItem(
            //               premium: adsController.adsListPremium[index].premium!,
            //               top: adsController.adsListPremium[index].top!,
            //               typeAd:
            //                   adsController.adsListPremium[index].typeAd ?? '',
            //               isFavorite: false,
            //               title:
            //                   adsController.adsListPremium[index].title ?? '',
            //               id: adsController.adsListPremium[index].id!,
            //               city: adsController.adsListPremium[index].cityName ??
            //                   'tashkent',
            //               price: adsController.adsListPremium[index].price
            //                       .toString() +
            //                   ' сум',
            //               date: adsController.adsListPremium[index].date!,
            //               imageUrl: adsController.adsListPremium[index].photo!,
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         adsController.loadMorePremium();
            //       },
            //       child: Center(
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 10,
            //             vertical: 10,
            //           ),
            //           decoration: BoxDecoration(
            //             color: ColorPalate.lightGreen,
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           child: Text('Загрузи больше'),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.only(left: 15, top: 5, bottom: 10),
            //       child: Text(
            //         'Топ объявление',
            //         style: FontStyles.boldStyle(
            //           fontSize: 18,
            //           fontFamily: 'Lato',
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
            //       child: GridView.builder(
            //         padding: EdgeInsets.zero,
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: adsController.adsListTop.length,
            //         gridDelegate:
            //             SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 5,
            //           mainAxisSpacing: 15,
            //           height: MediaQuery.of(context).size.height * 0.34,
            //         ),
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () => Get.to(() => ProductDetailScreen(
            //                 currencySort: '',
            //                 proId: adsController.adsListTop[index].id)),
            //             child: RecommandationItem(
            //               premium: adsController.adsListTop[index].premium!,
            //               top: adsController.adsListTop[index].top!,
            //               typeAd: adsController.adsListTop[index].typeAd ?? '',
            //               isFavorite: false,
            //               title: adsController.adsListTop[index].title ?? '',
            //               id: adsController.adsListTop[index].id!,
            //               city: adsController.adsListTop[index].cityName ??
            //                   'tashkent',
            //               price:
            //                   adsController.adsListTop[index].price.toString() +
            //                       ' сум',
            //               date: adsController.adsListTop[index].date!,
            //               imageUrl: adsController.adsListTop[index].photo!,
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         adsController.loadMoreTop();
            //       },
            //       child: Center(
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 10,
            //             vertical: 10,
            //           ),
            //           decoration: BoxDecoration(
            //             color: ColorPalate.lightGreen,
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           child: Text('Загрузи больше'),
            //         ),
            //       ),
            //     )
            //   ],
            // ),

            // SizedBox(height: 30),

            Container(
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 10),
              child: Text(
                'Рекомендованное вам',
                style: FontStyles.boldStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: adsController.adsList.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  height: MediaQuery.of(context).size.height * 0.34,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => ProductDetailScreen(
                        currencySort: '',
                        proId: adsController.adsList[index].id)),
                    child: RecommandationItem(
                      premium: adsController.adsList[index].premium!,
                      top: adsController.adsList[index].top!,
                      typeAd: adsController.adsList[index].typeAd ?? '',
                      isFavorite: false,
                      title: adsController.adsList[index].title ?? '',
                      id: adsController.adsList[index].id!,
                      city: adsController.adsList[index].cityName ?? 'tashkent',
                      price: formatCurrency
                              .format(adsController.adsList[index].price)
                              .replaceAll(',', ' ') +
                          ' сум',
                      date: adsController.adsList[index].date!,
                      imageUrl: adsController.adsList[index].photo!,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    });
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
    extends SliverGridDelegate {
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
    // ignore: unnecessary_null_comparison
  })  : assert(crossAxisCount != null && crossAxisCount > 0),
        // ignore: unnecessary_null_comparison
        assert(mainAxisSpacing != null && mainAxisSpacing >= 0),
        // ignore: unnecessary_null_comparison
        assert(crossAxisSpacing != null && crossAxisSpacing >= 0),
        // ignore: unnecessary_null_comparison
        assert(height != null && height > 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// The height of the crossAxis.
  final double height;

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(
      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}
