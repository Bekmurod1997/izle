import 'package:get/get.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/services/advertisement_list_services.dart';

class AdvertismentSubCategoryController extends GetxController {
  var isLoading = true.obs;
  var adSubCatList = <Data>[];

  @override
  void onInit() {
    fetchAdsSubCat(catId: '810');
    super.onInit();
  }

  void fetchAdsSubCat({required String catId}) async {
    try {
      isLoading(true);
      var fetchAdsSub =
          await AdvertisementListService.fetchSubCategoryProducts(catId: catId);
      if (fetchAdsSub != null) {
        adSubCatList.assignAll(fetchAdsSub.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
