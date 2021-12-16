import 'package:get/get.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/services/advertisement_list_services.dart';

class AdvertismentSubCategoryController extends GetxController {
  var isLoading = true.obs;
  var isLoadingTop = true.obs;
  var isLoadingPremium = true.obs;
  var isLoadMore = false.obs;
  var isLoadMoreTop = false.obs;
  var isLoadMorePremium = false.obs;
  var adSubCatList = AdvertisementListModel().obs;
  var adSubCatList2 = AdvertisementListModel().obs;
  var adSubCatList3 = AdvertisementListModel().obs;
  var adsSubList = <Data>[];
  var adsSubTopList = <Data>[];
  var adsSubPremiumList = <Data>[];
  var currentPage = 1.obs;
  var currentPageTop = 1.obs;
  var currentPagePremium = 1.obs;
  int _totalPage = 0;
  int _totalPageTop = 0;
  int _totalPagePremium = 0;
  var forFilter = false.obs;

  void currentPageChanger({required int curretP}) {
    currentPage.value = curretP;
  }

  void fetchAdsSubCat({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? searchWord,
    String? currenySort,
  }) async {
    print('this is fetchAdsSubCat in controller');
    try {
      isLoading(true);
      if (currentPage.value == 1) {
        adsSubList.clear();
      }
      var response = await AdvertisementListService.fetchSubCategoryProducts(
        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        page: currentPage.value,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
      );

      _totalPage = response?.mMeta?.pageCount ?? 0;
      adsSubList = response?.data ?? [];
      // print(response);
    } finally {
      isLoading(false);
    }
  }

  void fetchAdsSubCatTop({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? searchWord,
    String? currenySort,
  }) async {
    print('this is fetchAdsSubCatTop in controller');
    try {
      isLoadingTop(true);
      if (currentPageTop.value == 1) {
        adsSubTopList.clear();
      }
      var response = await AdvertisementListService.fetchSubCategoryTopProducts(
        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        page: currentPage.value,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
      );

      _totalPageTop = response?.mMeta?.pageCount ?? 0;
      adsSubTopList = response?.data ?? [];
      // print(response);
    } finally {
      isLoadingTop(false);
    }
  }

  void fetchAdsSubCatPremium({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? searchWord,
    String? currenySort,
  }) async {
    print('this is fetchAdsSubCatTop in controller');
    try {
      isLoadingPremium(true);
      if (currentPagePremium.value == 1) {
        adsSubList.clear();
      }
      var response =
          await AdvertisementListService.fetchSubCategoryPremiumProducts(
        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        page: currentPage.value,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
      );

      _totalPagePremium = response?.mMeta?.pageCount ?? 0;
      adsSubPremiumList = response?.data ?? [];
      // print(response);
    } finally {
      isLoadingPremium(false);
    }
  }

  void loadMore({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? searchWord,
    String? priceSort,
    String? currenySort,
    // required String catId
  }) async {
    print('this is loadMore in controller');

    print('loading more data');
    if (isLoadMore.value || currentPage >= _totalPage) return;
    isLoadMore.value = true;
    final nextPage = currentPage + 1;

    try {
      var response = await AdvertisementListService.fetchSubCategoryProducts(
        // catId: catId,
        page: nextPage.value,

        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        // page: currentPage,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
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

  void loadMoreTop({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? searchWord,
    String? priceSort,
    String? currenySort,
    // required String catId
  }) async {
    print('this is loadMore in controller');

    print('loading more data');
    if (isLoadMoreTop.value || currentPageTop >= _totalPageTop) return;
    isLoadMoreTop.value = true;
    final nextPage = currentPageTop + 1;

    try {
      var response = await AdvertisementListService.fetchSubCategoryTopProducts(
        // catId: catId,
        page: nextPage.value,

        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        // page: currentPage,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
      );
      var data = response?.data;
      if (data == null) return;
      adsSubTopList.addAll(data);
      currentPageTop = response?.mMeta?.currentPage ?? 1;
      _totalPageTop = response!.mMeta!.pageCount!;
      isLoadMoreTop.value = false;
      adSubCatList2(response);
      print(response);
    } catch (_) {
      isLoadMoreTop.value = false;
    }
  }

  void loadMorePremium({
    required String catId,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? searchWord,
    String? priceSort,
    String? currenySort,
    // required String catId
  }) async {
    print('this is loadMore in controller');

    print('loading more data');
    if (isLoadMorePremium.value || currentPagePremium >= _totalPagePremium)
      return;
    isLoadMorePremium.value = true;
    final nextPage = currentPagePremium + 1;

    try {
      var response =
          await AdvertisementListService.fetchSubCategoryPremiumProducts(
        // catId: catId,
        page: nextPage.value,

        cityId: cityId,
        catId: catId,
        searchWord: searchWord,
        // page: currentPage,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        currencySort: currenySort,
      );
      var data = response?.data;
      if (data == null) return;
      adsSubPremiumList.addAll(data);
      currentPagePremium = response?.mMeta?.currentPage ?? 1;
      _totalPagePremium = response!.mMeta!.pageCount!;
      isLoadMorePremium.value = false;
      adSubCatList3(response);
      print(response);
    } catch (_) {
      isLoadMorePremium.value = false;
    }
  }
}
