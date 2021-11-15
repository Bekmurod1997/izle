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
  }
}
