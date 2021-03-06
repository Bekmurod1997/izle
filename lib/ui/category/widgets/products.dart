// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:izle/constants/colors.dart';
// import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
// import 'package:izle/ui/category/widgets/product_item.dart';
// import 'package:izle/ui/product_detail/product_detail_screen.dart';

// class Products extends StatefulWidget {
//   final String catId;
//   Products({required this.catId});

//   @override
//   _ProductsState createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//   final AdvertismentSubCategoryController advertismentSubCategoryController =
//       Get.find<AdvertismentSubCategoryController>();
//   ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     advertismentSubCategoryController.fetchAdsSubCat(catId: widget.catId);
//     print(widget.catId);
//     print('this is initstate in products');
//     print(advertismentSubCategoryController.adSubCatList);
//     print('///////////');
//     // print(advertismentSubCategoryController.adSubCatList[0].title);
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         // allAdsController.currentPage++;
//         // allAdsController.fetchAllAds();

//         if (advertismentSubCategoryController.currentPage <
//             advertismentSubCategoryController
//                 .adSubCatList()
//                 .mMeta!
//                 .pageCount!) {
//           advertismentSubCategoryController.currentPage++;
//           advertismentSubCategoryController.adSubCatList();
//         } else {
//           print('nothing to scroll');
//         }
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (advertismentSubCategoryController.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
//           ),
//         );
//       } else {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//           child: GridView.builder(
//             controller: _scrollController,
//             padding: EdgeInsets.zero,
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount:
//                 advertismentSubCategoryController.adSubCatList().data?.length ??
//                     0,
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
//               crossAxisCount: 2,
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//               height: MediaQuery.of(context).size.height * 0.3,
//             ),
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () => Get.to(() => ProductDetailScreen(
//                       proId: advertismentSubCategoryController
//                           .adSubCatList()
//                           .data![index]
//                           .id,
//                     )),
//                 child: ProductItem(
//                     cityName: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .cityName,
//                     date: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .date,
//                     imageUrl: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .photo,
//                     price: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .price
//                         .toString(),
//                     title: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .title,
//                     id: advertismentSubCategoryController
//                         .adSubCatList()
//                         .data![index]
//                         .id!,
//                     isFavorite: false),
//               );
//             },
//           ),
//         );
//       }
//     });
//   }
// }

// class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
//     extends SliverGridDelegate {
//   /// Creates a delegate that makes grid layouts with a fixed number of tiles in
//   /// the cross axis.
//   ///
//   /// All of the arguments must not be null. The `mainAxisSpacing` and
//   /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
//   /// and `childAspectRatio` arguments must be greater than zero.
//   const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
//     // ignore: invalid_required_named_param
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
