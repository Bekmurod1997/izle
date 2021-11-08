import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class AllAdsController extends GetxController {
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  var allAdsList = AdvertisementListModel().obs;
  var adsList = <Data>[];
  var currentPage = 1;
  int _totalPage = 0;
  RxList<Data> allAdsList2 = <Data>[].obs;
  void fetchAllAds() async {
    print('fetching all ads in controller');

    try {
      isLoading(true);
      var response = await AllServices.listOfAllAds(currentPage);
      _totalPage = response?.mMeta?.pageCount ?? 0;
      // int? pageCount = adsList?.mMeta?.pageCount;
      // if (pageCount == null || currentPage > pageCount) {
      //   return;
      // }
      // if (currentPage > 1) {
      //   allAdsList().data!.addAll(adsList.data);
      //   return;
      // }
      adsList = response?.data ?? [];
      print(response);
    } finally {
      isLoading(false);
    }
  }

  void loadMore() async {
    print('loading more data');
    if (isLoadMore.value || currentPage >= _totalPage) return;
    isLoadMore.value = true;
    final nextPage = currentPage + 1;

    try {
      var response = await AllServices.listOfAllAds(nextPage);
      var data = response?.data;
      if (data == null) return;
      adsList.addAll(data);
      currentPage = response?.mMeta?.currentPage ?? 1;
      _totalPage = response!.mMeta!.pageCount!;
      isLoadMore.value = false;
      allAdsList(response);
      print(response);
    } catch (_) {
      isLoadMore.value = false;
    }

    // if (currentPage > 1) {
    //   allAdsList().data!.addAll(adsList.data);
    //   return;
    // }
  }

  // void showedAdsAtIndex(int index) {
  //   if (index < allAdsList().data!.length - 1) return;
  //   loadMore();
  // }
}



//   void loadMoreAds() async {
//     print('loadingMOre Ads function');
//     isLoading(true);
//     isLoadMore(true);
//     try {
//       var adsList = await AllServices.listOfAllAds(currentPage);
//       if (currentPage > adsList.mMeta.pageCount) {
//         return;
//       }
//       if (currentPage > 1) {
//         allAdsList().data!.addAll(adsList.data);
//         return;
//       }
//       allAdsList(adsList);
//       print(adsList);
//     } finally {
//       isLoading(false);
//     }
//   }
// }
  // void fetchAllAds() async {
  //   print('fetching all ads in controller');

  //   try {
  //     isLoading(true);
  //     var adsList = await AllServices.listOfAllAds(currentPage);
  //     if (currentPage > 1) {
  //       allAdsList().data!.addAll(adsList.data);
  //     }
  //     allAdsList(adsList);
  //     print(adsList);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

// class AllAdsController extends GetxController {
//   var isLoading = true.obs;
//   var allAdsList = <Data>[];

//   void fetchAllAds() async {
//     try {
//       isLoading(true);
//       var adsList = await AllServices.listOfAllAds();
//       if (adsList != null) {
//         allAdsList.assignAll(adsList.data);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
