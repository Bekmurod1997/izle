import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/ui/home/widgets/search.dart';
import 'package:izle/utils/my_prefs.dart';

import 'widgets/recommendation.dart';
import 'package:get/get.dart';

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
    return ListView(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Obx(() {
              if (adsController.isLoading.value) {
                return Container();
              } else {
                return Search();
              }
            }),
            Obx(() {
              if (adsController.isLoading.value) {
                return Container();
              } else {
                return Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 15, top: 5, bottom: 0),
                  child: Text(
                    'Рекомендованное вам',
                    style: FontStyles.regularStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      color: Colors.black,
                    ),
                  ),
                );
              }
            }),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: GestureDetector(
                onTap: () {
                  print('aaaaa');
                  MyPref.clearAllll();
                },
                child: Text('sss'),
              ),
            ),
            // Categories(),

            SizedBox(height: 10),
          ],
        ),
        Recommendation(),
      ],
    );

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
