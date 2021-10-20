import 'package:get/get.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/services/all_services.dart';

class AuthorAdsController extends GetxController {
  var isLoading = true.obs;
  var allAuthorAdsList = AdvertisementListModel().obs;
  var currentPage = 1;

  void fetchAuthorOrders({int? userId}) async {
    try {
      isLoading(true);
      var authorAds =
          await AllServices.authorOrders(page: currentPage, userId: userId);
      if (currentPage > authorAds.mMeta.pageCount) {
        return;
      }
      if (currentPage > 1) {
        allAuthorAdsList().data!.addAll(authorAds.data);
        return;
      }
      allAuthorAdsList(authorAds);
      print(authorAds);
    } finally {
      isLoading(false);
    }
  }
}
