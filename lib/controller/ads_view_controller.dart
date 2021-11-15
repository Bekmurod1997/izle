import 'package:izle/services/all_services.dart';
import 'package:get/get.dart';
import 'package:izle/models/ads_view_model.dart';

class AdsViewController extends GetxController {
  var isLoading = true.obs;
  var adsViewList = <Data>[];

  void fetchAdsView() async {
    try {
      isLoading(true);
      var adsView = await AllServices.adView();
      if (adsView != null) {
        adsViewList.assignAll(adsView.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
