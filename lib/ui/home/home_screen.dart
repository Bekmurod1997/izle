import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/home/widgets/search.dart';
import 'package:get/get.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/utils/my_prefs.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AllAdsController adsController = Get.find<AllAdsController>();
  final SearchController searchController = Get.put(SearchController());
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    adsController.fetchAllAds();

    print('my token');
    print(MyPref.token);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // allAdsController.currentPage++;
        // allAdsController.fetchAllAds();
        _getMoreData();
        if (adsController.currentPage <
            adsController.allAdsList().mMeta!.pageCount!) {
          adsController.currentPage++;
          adsController.fetchAllAds();
        } else {
          print('nothing to scroll');
        }
      }
    });

    super.initState();
  }

  _getMoreData() {
    print('end');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (adsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorPalate.mainColor,
          ),
        );
      } else {
        return ListView(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            children: [
              Search(),
              Container(
                // color: Colors.red,
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
                  // reverse: true,
                  // controller: _scrollController,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: adsController.allAdsList().data?.length ?? 0,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 15,
                    // height: MediaQuery.of(context).size.height * 0.4,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => ProductDetailScreen(
                          proId: adsController.allAdsList().data![index].id)),
                      child: RecommandationItem(
                        isFavorite: false,
                        title:
                            adsController.allAdsList().data?[index].title ?? '',
                        id: adsController.allAdsList().data![index].id!,
                        city:
                            adsController.allAdsList().data?[index].cityName ??
                                'tashkent',
                        price: adsController
                            .allAdsList()
                            .data![index]
                            .price
                            .toString(),
                        date: adsController.allAdsList().data![index].date!,
                        imageUrl:
                            adsController.allAdsList().data![index].photo!,
                      ),
                    );
                  },
                ),
              ),
            ]);
      }
    });

    //     ListView(
    //   padding: EdgeInsets.zero,
    //   controller: _scrollController,
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SizedBox(height: 20),
    //         Search(),
    //         // Obx(() {
    //         //   if (adsController.isLoading.value) {
    //         //     return Container();
    //         //   } else {
    //         //     return Search();
    //         //   }
    //         // }),
    //         // Obx(() {
    //         //   if (adsController.isLoading.value) {
    //         //     return Container();
    //         //   } else {
    //         //     return Container(
    //         //       // color: Colors.red,
    //         //       padding: EdgeInsets.only(left: 15, top: 5, bottom: 10),
    //         //       child: Text(
    //         //         'Рекомендованное вам',
    //         //         style: FontStyles.boldStyle(
    //         //           fontSize: 18,
    //         //           fontFamily: 'Lato',
    //         //           color: Colors.black,
    //         //         ),
    //         //       ),
    //         //     );
    //         //   }
    //         // }),
    //         Container(
    //           // color: Colors.red,
    //           padding: EdgeInsets.only(left: 15, top: 5, bottom: 10),
    //           child: Text(
    //             'Рекомендованное вам',
    //             style: FontStyles.boldStyle(
    //               fontSize: 18,
    //               fontFamily: 'Lato',
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),

    //         // Categories(),

    //         SizedBox(height: 10),
    //       ],
    //     ),
    //     Recommendation(
    //       scrollController: _scrollController,
    //     ),
    //     // Container(height: 20),
    //   ],
    // );

    // SingleChildScrollView(
    //   // physics: ScrollPhysics(),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       SizedBox(height: 20),
    //       Obx(() {
    //         if (adsController.isLoading.value) {
    //           return Container();
    //         } else {
    //           return Search();
    //         }
    //       }),
    //       Obx(() {
    //         if (adsController.isLoading.value) {
    //           return Container();
    //         } else {
    //           return Container(
    //             // color: Colors.red,
    //             padding: EdgeInsets.only(left: 15, top: 5, bottom: 0),
    //             child: Text(
    //               'Рекомендованное вам',
    //               style: FontStyles.regularStyle(
    //                 fontSize: 18,
    //                 fontFamily: 'Lato',
    //                 color: Colors.black,
    //               ),
    //             ),
    //           );
    //         }
    //       }),
    //       // Categories(),

    //       SizedBox(height: 10),
    //       Flexible(
    //         fit: FlexFit.loose,
    //         child: GestureDetector(
    //           // onTap: () => Get.to(() => ProductDetailScreen()),
    //           child: Recommendation(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
    extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    // ignore: invalid_required_named_param
    @required this.crossAxisCount = 2,
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
