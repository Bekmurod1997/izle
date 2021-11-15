import 'package:get/get.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/services/advertisement_list_services.dart';

class AdvertismentSubCategoryController extends GetxController {
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  var adSubCatList = AdvertisementListModel().obs;
  var adsSubList = <Data>[];
  var currentPage = 1;
  int _totalPage = 0;
  var forFilter = false.obs;

  // @override
  // void onInit() {
  //   fetchAdsSubCat(catId: '810');
  //   super.onInit();
  // }

  void fetchAdsSubCat({
    required String catId,
  }) async {
    print('this is fetchAdsSubCat in controller');
    try {
      isLoading(true);
      var response = await AdvertisementListService.fetchSubCategoryProducts(
          catId: catId, page: currentPage);
      _totalPage = response?.mMeta?.pageCount ?? 0;
      adsSubList = response?.data ?? [];
      print(response);
    } finally {
      isLoading(false);
    }
  }

  void fetchAdsSubCatWithCityId({
    required String catId,
    required int cityId,
  }) async {
    print('this is fetchAdsSubCat in controller');
    try {
      isLoading(true);
      var response =
          await AdvertisementListService.fetchSubCategoryProductsWithCity(
              catId: catId, cityId: cityId);
      _totalPage = response?.mMeta?.pageCount ?? 0;
      adsSubList = response?.data ?? [];
      print(response);
    } finally {
      isLoading(false);
    }
  }

  void loadMore({required String catId}) async {
    print('this is loadMore in controller');

    print('loading more data');
    if (isLoadMore.value || currentPage >= _totalPage) return;
    isLoadMore.value = true;
    final nextPage = currentPage + 1;

    try {
      var response = await AdvertisementListService.fetchSubCategoryProducts(
        catId: catId,
        page: nextPage,
      );
      var data = response?.data;
      if (data == null) return;
      adsSubList.addAll(data);
      currentPage = response?.mMeta?.currentPage ?? 1;
      _totalPage = response!.mMeta!.pageCount!;
      isLoadMore.value = false;
      adSubCatList(response);
      print(response);
    } catch (_) {
      isLoadMore.value = false;
    }
  }
}
