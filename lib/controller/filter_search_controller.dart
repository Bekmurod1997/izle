import 'package:get/get.dart';
import 'package:izle/models/all_categories_model.dart';

class FilterSearchController extends GetxController {
  var subCategoyList = <Childs>[];
  var searchWord = ''.obs;
  var mainCategoryId = 0.obs;
  var mainCategoryName = ''.obs;
  var sortingType = ''.obs;
  var cityName = ''.obs;
  var cityId = 0.obs;
  var districtName = ''.obs;

  var price_start = ''.obs;
  var price_finish = ''.obs;
  var subCategoryId = 0.obs;
  var subCategoryName = ''.obs;

  var currencySort = ''.obs;

  void resetAllForSearchController() {
    subCategoyList = [];
    searchWord = ''.obs;
    mainCategoryId = 0.obs;
    mainCategoryName = ''.obs;
    sortingType = ''.obs;
    cityName = ''.obs;
    cityId = 0.obs;
    districtName = ''.obs;

    price_start = ''.obs;
    price_finish = ''.obs;
    subCategoryId = 0.obs;
    subCategoryName = ''.obs;
    currencySort.value = '';
  }
}
