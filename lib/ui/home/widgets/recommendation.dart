import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/favorities_controller.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';

// ignore: must_be_immutable
class Recommendation extends StatefulWidget {
  ScrollController scrollController;
  Recommendation({required this.scrollController});
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  final AllAdsController allAdsController = Get.find<AllAdsController>();
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  ScrollController _scrollController = ScrollController();

  var currentPage = 1;
  // List<AdvertisementListModel> addds = [];

  @override
  Widget build(BuildContext context) {
    // var mmm = allAdsController.allAdsList().data.;

    return Obx(() {
      if (allAdsController.isLoading.value &&
          allAdsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
          ),
        );
      } else {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allAdsController.allAdsList().data?.length ?? 0,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  // height: MediaQuery.of(context).size.height * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => ProductDetailScreen(
                        proId: allAdsController.allAdsList().data![index].id)),
                    child: RecommandationItem(
                      premium:
                          allAdsController.allAdsList().data?[index].premium ??
                              0,
                      top: allAdsController.allAdsList().data?[index].top ?? 0,
                      isFavorite: false,
                      title: allAdsController.allAdsList().data?[index].title ??
                          '',
                      id: allAdsController.allAdsList().data![index].id!,
                      typeAd:
                          allAdsController.allAdsList().data![index].typeAd ??
                              'price',
                      city:
                          allAdsController.allAdsList().data?[index].cityName ??
                              'tashkent',
                      price: allAdsController
                          .allAdsList()
                          .data![index]
                          .price
                          .toString(),
                      date: allAdsController.allAdsList().data![index].date!,
                      imageUrl:
                          allAdsController.allAdsList().data![index].photo!,
                    ),
                  );
                },
              ),
            ),
            if (allAdsController.currentPage ==
                allAdsController.allAdsList().mMeta!.pageCount)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Больше объявлений не выявлено',
                  style: TextStyle(fontSize: 20),
                ),
              )
          ],
        );

        // allAdsController.currentPage <
        //         allAdsController.allAdsList().mMeta!.pageCount!
        //     ? TextButton(
        //         onPressed: () {
        //           allAdsController.currentPage++;
        //           allAdsController.fetchAllAds();
        //         },
        //         child: Text('loadmore'),
        //       )
        //     : Container(),

      }
    });
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
