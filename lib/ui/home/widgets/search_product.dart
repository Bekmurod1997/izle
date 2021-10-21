import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';

class SearchProduct extends StatefulWidget {
  final String searchTitle;
  SearchProduct({required this.searchTitle});

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  // final AllAdsController allAdsController = Get.find<AllAdsController>();
  // final FavoriteController favoriteController = Get.find<FavoriteController>();
  final SearchController sController = Get.find<SearchController>();
  var currentPage = 1;
  // List<AdvertisementListModel> addds = [];
  @override
  void initState() {
    print('this is search product init');
    print('---------');
    print(sController.searchTitle.value);
    print('---------');
    sController.fetchSearch(widget.searchTitle);

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      sController.fetchSearch(widget.searchTitle);
    });
  }

  // @override
  // void didChangeDependencies() {
  //   print('calling didchangeDepande');
  //   sController.fetchSearch(widget.searchTitle);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // var mmm = allAdsController.allAdsList().data.;

    return Obx(() {
      if (sController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Мы нашли ${sController.allSearchList().mMeta!.totalCount} объявлений',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sController.allSearchList().data!.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  height: MediaQuery.of(context).size.height * 0.4,
                  // height: MediaQuery.of(context).size.height * 0.3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => ProductDetailScreen(
                        proId: sController.allSearchList().data![index].id!)),
                    child: RecommandationItem(
                      isFavorite: false,
                      title: sController.allSearchList().data![index].title!,
                      id: sController.allSearchList().data![index].id!,
                      city: sController.allSearchList().data![index].cityName!,
                      price: sController
                          .allSearchList()
                          .data![index]
                          .price
                          .toString(),
                      date: sController.allSearchList().data![index].date!,
                      imageUrl: sController.allSearchList().data![index].photo!,
                    ),
                  );
                },
              ),
            ),
            sController.currentPage <
                    sController.allSearchList().mMeta!.pageCount!
                ? TextButton(
                    onPressed: () {
                      sController.currentPage++;
                      sController.fetchSearch(widget.searchTitle);
                    },
                    child: Text('loadmore'),
                  )
                : Container(),
          ],
        );
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
