import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class AllAdsController extends GetxController {
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;
  var isLoadMore = false.obs;
  var isLoadMore2 = false.obs;
  var isLoadMore3 = false.obs;
  var allAdsList = AdvertisementListModel().obs;
  var allAdsList2 = AdvertisementListModel().obs;
  var allAdsList3 = AdvertisementListModel().obs;
  var adsList = <Data>[];
  var adsListPremium = <Data>[];
  var adsListTop = <Data>[];
  var currentPage = 1;
  var currentPageTop = 1;
  var currentPagePremium = 1;
  int _totalPage = 0;
  int _totalPageTop = 0;
  int _totalPagePremium = 0;
  var totalAd = 0.obs;
  var totalTopAd = 0.obs;
  var totalPremuimAd = 0.obs;

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

  void fetchAllPremiumAds() async {
    print('fetching all ads in controller');

    try {
      isLoading2(true);
      var response = await AllServices.listOfAllPremiumAds(currentPagePremium);
      _totalPagePremium = response?.mMeta?.pageCount ?? 0;
      totalPremuimAd.value = response?.mMeta?.pageCount ?? 0;
      adsListPremium = response?.data ?? [];
      print(response);
    } finally {
      isLoading2(false);
    }
  }

  void fetchAllTopAds() async {
    print('fetching all ads in controller');

    try {
      isLoading3(true);
      var response = await AllServices.listOfAllTopAds(currentPageTop);
      _totalPageTop = response?.mMeta?.pageCount ?? 0;

      adsListTop = response?.data ?? [];
      print(response);
    } finally {
      isLoading3(false);
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

  void loadMorePremium() async {
    print('loading more data');
    if (isLoadMore2.value || currentPagePremium >= _totalPagePremium) return;
    isLoadMore2.value = true;
    final nextPage = currentPagePremium + 1;

    try {
      var response = await AllServices.listOfAllPremiumAds(nextPage);
      var data = response?.data;
      if (data == null) return;
      adsListPremium.addAll(data);
      currentPagePremium = response?.mMeta?.currentPage ?? 1;
      _totalPagePremium = response!.mMeta!.pageCount!;
      isLoadMore2.value = false;
      allAdsList2(response);
      print(response);
    } catch (_) {
      isLoadMore.value = false;
    }
  }

  void loadMoreTop() async {
    print('loading more data');
    if (isLoadMore3.value || currentPageTop >= _totalPageTop) return;
    isLoadMore3.value = true;
    final nextPage = currentPageTop + 1;

    try {
      var response = await AllServices.listOfAllPremiumAds(nextPage);
      var data = response?.data;
      if (data == null) return;
      adsListTop.addAll(data);
      currentPageTop = response?.mMeta?.currentPage ?? 1;
      _totalPageTop = response!.mMeta!.pageCount!;
      isLoadMore3.value = false;
      allAdsList3(response);
      print(response);
    } catch (_) {
      isLoadMore.value = false;
    }
  }
}
