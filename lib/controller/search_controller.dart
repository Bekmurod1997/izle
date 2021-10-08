import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var allSearchList = AdvertisementListModel().obs;
  var currentPage = 1;
  var searchTitle = 'nothing'.obs;

  void searchTitleChanger({required String sTitle}) {
    searchTitle.value = sTitle;
  }

  void fetchSearch(String search) async {
    print('fetching search');
    try {
      isLoading(true);
      var adsList = await AllServices.search(search, currentPage);
      if (currentPage > adsList.mMeta.pageCount) {
        return;
      }
      if (currentPage > 1) {
        allSearchList().data!.addAll(adsList.data);
        return;
      }
      allSearchList(adsList);
      print(adsList);
    } finally {
      isLoading(false);
    }
  }
}
