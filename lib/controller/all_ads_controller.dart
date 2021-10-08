import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class AllAdsController extends GetxController {
  var isLoading = true.obs;
  var allAdsList = AdvertisementListModel().obs;
  var currentPage = 1;

  void fetchAllAds() async {
    print('fetching all ads in controller');

    try {
      isLoading(true);
      var adsList = await AllServices.listOfAllAds(currentPage);
      if (currentPage > adsList.mMeta.pageCount) {
        return;
      }
      if (currentPage > 1) {
        allAdsList().data!.addAll(adsList.data);
        return;
      }
      allAdsList(adsList);
      print(adsList);
    } finally {
      isLoading(false);
    }
  }
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
}
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
