import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  var allSearchList = AdvertisementListModel().obs;
  var searchList = <Data>[];
  var currentPage = 1;
  int _totalPage = 0;
  var searchTitle = 'nothing'.obs;

  void searchTitleChanger({required String sTitle}) {
    searchTitle.value = sTitle;
  }

  void fetchSearch(String search) async {
    print('fetching search');
    try {
      isLoading(true);
      var response = await AllServices.search(
        search: search,
        page: currentPage,
      );
      _totalPage = response?.mMeta?.pageCount ?? 0;
      searchList.clear();
      searchList = response?.data ?? [];
      print(response);
    } finally {
      isLoading(false);
    }
  }

  void loadMore({required String search}) async {
    print('loading more data');
    if (isLoadMore.value || currentPage >= _totalPage) return;
    isLoadMore.value = true;
    final nextPage = currentPage + 1;

    try {
      var response = await AllServices.search(search: search, page: nextPage);
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
}
