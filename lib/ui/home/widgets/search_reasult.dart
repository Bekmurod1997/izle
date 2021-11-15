import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/home/widgets/filter_page.dart';
import 'package:flutter/rendering.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';

import 'package:izle/ui/product_detail/product_detail_screen.dart';

import '../home_screen.dart';

class SearchResult extends StatefulWidget {
  // final String searchResult;
  // SearchResult({required this.searchResult});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final SearchController sController = Get.find<SearchController>();
  ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('this is search word');
      print(sController.searchTitle.value);
      sController.fetchSearch(sController.searchTitle.value);

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          sController.loadMore(search: sController.searchTitle.value);
          print('scrolling');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: searchController,
                    // controller: TextEditingController(
                    //     text: sController.searchTitle.value),
                    // controller: searchController,
                    onSubmitted: (value) {
                      sController.searchTitleChanger(
                          sTitle: searchController.text);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          sController.searchTitleChanger(
                              sTitle: searchController.text);
                          print('afterrrrrr');

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (BuildContext context) => this.widget),
                          // );

                          Get.back();
                          Get.to(() => SearchResult(
                              // searchResult:
                              //     sController.searchTitle.toString(),
                              ));
                        },
                        icon: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      hintText: 'Что вы ищете?',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(
                    () => FilterPage(),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    margin: const EdgeInsets.only(top: 25, right: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/f.svg',
                      height: 22,
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              if (sController.isLoading.value &&
                  !sController.isLoadMore.value) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
                  ),
                );
              } else {
                print('+++++');
                print(sController.searchList.length);
                return sController.searchList.length == 0
                    ? Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/ss.png',
                              fit: BoxFit.fitWidth,
                            ),
                            Text('К сожалению, мы не нашли ничего похожего...')
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Мы нашли  объявлений',
                              // 'Мы нашли ${sController.allSearchList().mMeta?.totalCount} объявлений',
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
                              itemCount: sController.searchList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => ProductDetailScreen(
                                      proId:
                                          sController.searchList[index].id!)),
                                  child: RecommandationItem(
                                    isFavorite: false,
                                    title: sController.searchList[index].title!,
                                    id: sController.searchList[index].id!,
                                    city:
                                        sController.searchList[index].cityName!,
                                    price: sController.searchList[index].price
                                        .toString(),
                                    date: sController.searchList[index].date!,
                                    imageUrl:
                                        sController.searchList[index].photo!,
                                  ),
                                );
                              },
                            ),
                          ),
                          // sController.currentPage <
                          //         sController.allSearchList().mMeta!.pageCount!
                          //     ? TextButton(
                          //         onPressed: () {
                          //           sController.currentPage++;
                          //           sController.fetchSearch(widget.searchTitle);
                          //         },
                          //         child: Text('loadmore'),
                          //       )
                          //     : Container(),
                        ],
                      );
              }
            }),
          ],
        ),
      ),
    );
  }
}

// class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
//     extends SliverGridDelegate {
//   /// Creates a delegate that makes grid layouts with a fixed number of tiles in

//   const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
//     @required this.crossAxisCount = 2,
//     this.mainAxisSpacing = 0.0,
//     this.crossAxisSpacing = 0.0,
//     this.height = 56.0,
//     // ignore: unnecessary_null_comparison
//   })  : assert(crossAxisCount != null && crossAxisCount > 0),
//         // ignore: unnecessary_null_comparison
//         assert(mainAxisSpacing != null && mainAxisSpacing >= 0),
//         // ignore: unnecessary_null_comparison
//         assert(crossAxisSpacing != null && crossAxisSpacing >= 0),
//         // ignore: unnecessary_null_comparison
//         assert(height != null && height > 0);

//   /// The number of children in the cross axis.
//   final int crossAxisCount;

//   /// The number of logical pixels between each child along the main axis.
//   final double mainAxisSpacing;

//   /// The number of logical pixels between each child along the cross axis.
//   final double crossAxisSpacing;

//   /// The height of the crossAxis.
//   final double height;

//   bool _debugAssertIsValid() {
//     assert(crossAxisCount > 0);
//     assert(mainAxisSpacing >= 0.0);
//     assert(crossAxisSpacing >= 0.0);
//     assert(height > 0.0);
//     return true;
//   }

//   @override
//   SliverGridLayout getLayout(SliverConstraints constraints) {
//     assert(_debugAssertIsValid());
//     final double usableCrossAxisExtent =
//         constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
//     final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
//     final double childMainAxisExtent = height;
//     return SliverGridRegularTileLayout(
//       crossAxisCount: crossAxisCount,
//       mainAxisStride: childMainAxisExtent + mainAxisSpacing,
//       crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
//       childMainAxisExtent: childMainAxisExtent,
//       childCrossAxisExtent: childCrossAxisExtent,
//       reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
//     );
//   }

//   @override
//   bool shouldRelayout(
//       SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
//     return oldDelegate.crossAxisCount != crossAxisCount ||
//         oldDelegate.mainAxisSpacing != mainAxisSpacing ||
//         oldDelegate.crossAxisSpacing != crossAxisSpacing ||
//         oldDelegate.height != height;
//   }
// }
