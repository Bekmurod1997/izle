import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/favorities_controller.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';

class Recommendation extends StatefulWidget {
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
  void initState() {
    print('this is recommendation');
    allAdsController.fetchAllAds();
    print(allAdsController.allAdsList);
    print('++++++++++++++++++++++++++');
    favoriteController.fetchFavorites();
    print('favoriteeeeeees');
    print('123123dasd  +${favoriteController.favoriteList}');
    print('----___----');
    // print(allAdsController.allAdsList().mMeta!.pageCount);

    // addds.assignAll(allAdsController.allAdsList.)

    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     // allAdsController.currentPage++;
    //     // allAdsController.fetchAllAds();
    //     _getMoreData();
    //   }
    // });
    super.initState();
  }

  _getMoreData() {
    print('end');
  }

  @override
  Widget build(BuildContext context) {
    // var mmm = allAdsController.allAdsList().data.;
    final List<Map> myProducts =
        List.generate(40, (index) => {"id": index, "name": "Product $index"})
            .toList();
    return Obx(() {
      if (allAdsController.isLoading.value &&
          favoriteController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
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
              return RecommandationItem(
                isFavorite: false,
                title: allAdsController.allAdsList().data![index].title!,
                id: allAdsController.allAdsList().data![index].id!,
                city: allAdsController.allAdsList().data![index].cityName!,
                price:
                    allAdsController.allAdsList().data![index].price.toString(),
                date: allAdsController.allAdsList().data![index].date!,
                imageUrl: allAdsController.allAdsList().data![index].photo!,
              );
            },
          ),
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
