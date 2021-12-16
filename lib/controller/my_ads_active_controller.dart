import 'package:get/get.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/services/all_services.dart';

class MyAdsActiveController extends GetxController {
  var isLoading = true.obs;
  var allMyAdsList = AdvertisementListModel().obs;
  var currentPage = 1;

  void fetchMyActiveOrders() async {
    try {
      isLoading(true);
      var myAds = await AllServices.myActiveOrders();
      // if (currentPage > myAds.mMeta.pageCount) {
      //   return;
      // }
      if (currentPage > 1) {
        allMyAdsList().data!.addAll(myAds.data);
        return;
      }
      allMyAdsList(myAds);
      print(myAds);
    } finally {
      isLoading(false);
    }
  }
}
