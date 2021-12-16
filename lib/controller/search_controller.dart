import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var isLoadingTop = true.obs;
  var isLoadingPremium = true.obs;
  var isLoadMore = false.obs;
  var isLoadMoreTop = false.obs;
  var isLoadMorePremium = false.obs;
  var allSearchList = AdvertisementListModel().obs;
  var allSearchList2 = AdvertisementListModel().obs;
  var allSearchList3 = AdvertisementListModel().obs;
  var searchList = <Data>[];
  var searchListTop = <Data>[];
  var searchListPremium = <Data>[];
  var currentPage = 1.obs;
  var currentPageTop = 1.obs;
  var currentPagePremium = 1.obs;
  int _totalPage = 0;
  int _totalPageTop = 0;
  int _totalPagePremium = 0;
  var searchTitle = ''.obs;

  void searchTitleChanger({required String sTitle}) {
    searchTitle.value = sTitle;
  }

  void fetchSearch({
    String? search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('fetching search');
    try {
      isLoading(true);
      if (currentPage.value == 1) {
        searchList.clear();
      }
      var response = await AllServices.search(
        currencySort: currencySort,
        search: search,
        page: currentPage.value,
        cityId: cityId,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        categoryId: categoryId,
      );
      _totalPage = response?.mMeta?.pageCount ?? 0;
      // searchList.clear();
      searchList = response?.data ?? [];
      print(response);
    } finally {
      isLoading(false);
    }
  }

  void fetchSearchTop({
    String? search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('fetching search');
    try {
      isLoadingTop(true);
      if (currentPageTop.value == 1) {
        searchListTop.clear();
      }
      var response = await AllServices.searchTop(
        currencySort: currencySort,
        search: search,
        page: currentPage.value,
        cityId: cityId,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        categoryId: categoryId,
      );
      _totalPageTop = response?.mMeta?.pageCount ?? 0;
      // searchList.clear();
      searchListTop = response?.data ?? [];
      print(response);
    } finally {
      isLoadingTop(false);
    }
  }

  void fetchSearchPremium({
    String? search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('fetching search');
    try {
      isLoadingPremium(true);
      if (currentPagePremium.value == 1) {
        searchListPremium.clear();
      }
      var response = await AllServices.searchPremium(
        currencySort: currencySort,
        search: search,
        page: currentPage.value,
        cityId: cityId,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
        categoryId: categoryId,
      );
      _totalPagePremium = response?.mMeta?.pageCount ?? 0;
      // searchList.clear();
      searchListPremium = response?.data ?? [];
      print(response);
    } finally {
      isLoadingPremium(false);
    }
  }

  void loadMore({
    required String search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('loading more data');
    if (isLoadMore.value || currentPage >= _totalPage) return;
    isLoadMore.value = true;
    final nextPage = currentPage + 1;

    try {
      var response = await AllServices.search(
        search: search,
        page: nextPage.value,
        categoryId: categoryId,
        cityId: cityId,
        currencySort: currencySort,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
      );
      var data = response?.data;
      if (data == null) return;
      searchList.addAll(data);
      currentPage = response?.mMeta?.currentPage ?? 1;
      _totalPage = response!.mMeta!.pageCount!;
      isLoadMore.value = false;
      allSearchList(response);
      print(response);
    } catch (_) {
      isLoadMore.value = false;
    }
  }

  void loadMoreTop({
    required String search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('loading more data in top');
    if (isLoadMoreTop.value || currentPageTop >= _totalPageTop) return;
    isLoadMoreTop.value = true;
    final nextPage = currentPageTop + 1;

    try {
      var response = await AllServices.searchTop(
        search: search,
        page: nextPage.value,
        categoryId: categoryId,
        cityId: cityId,
        currencySort: currencySort,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
      );
      var data = response?.data;
      if (data == null) return;
      searchListTop.addAll(data);
      currentPageTop = response?.mMeta?.currentPage ?? 1;
      _totalPageTop = response!.mMeta!.pageCount!;
      isLoadMoreTop.value = false;
      allSearchList2(response);
      print(response);
    } catch (_) {
      isLoadMoreTop.value = false;
    }
  }

  void loadMorePremium({
    required String search,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('loading more data in premium');
    if (isLoadMorePremium.value || currentPagePremium >= _totalPagePremium)
      return;
    isLoadMorePremium.value = true;
    final nextPage = currentPagePremium + 1;

    try {
      var response = await AllServices.searchPremium(
        search: search,
        page: nextPage.value,
        categoryId: categoryId,
        cityId: cityId,
        currencySort: currencySort,
        priceFinish: priceFinish,
        priceSort: priceSort,
        priceStart: priceStart,
      );
      var data = response?.data;
      if (data == null) return;
      searchListPremium.addAll(data);
      currentPagePremium = response?.mMeta?.currentPage ?? 1;
      _totalPagePremium = response!.mMeta!.pageCount!;
      isLoadMorePremium.value = false;
      allSearchList3(response);
      print(response);
    } catch (_) {
      isLoadMorePremium.value = false;
    }
  }
}
