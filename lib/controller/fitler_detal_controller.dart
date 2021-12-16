import 'package:get/get.dart';

class FilterDetalController extends GetxController {
  var searchWord = ''.obs;
  var mainCategoryId = 0.obs;
  var mainCategoryName = ''.obs;
  var sortingType = ''.obs;
  var cityName = ''.obs;
  var cityId = 0.obs;
  var districtName = ''.obs;
  var currencySort = ''.obs;

  var price_start = ''.obs;
  var price_finish = ''.obs;
  var subCategoryId = 0.obs;
  var subCategoryName = ''.obs;

  void resetAll() {
    searchWord = ''.obs;

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

  // void resetAll() {
  //   // sortingType.value = 'nothing';
  //   cityName.value = '';
  //   cityId.value =0;

  //   price_start.value =;
  //   price_finish.value = '';
  //   subCategoryId.value = 0;
  //   subCategoryName.value = '';
  // }
  void changerSearchWord({String? searchW}) {
    searchWord.value = searchW ?? "";
  }

  void changerMainCategoryId({required int mainCategoryIdd}) {
    mainCategoryId.value = mainCategoryIdd;
  }

  void changerMainCategoryName({required String catName}) {
    mainCategoryName.value = catName;
  }

  void changerCityName({required String cityNamee}) {
    cityName.value = cityNamee;
  }

  void changerSubCategoryName({required String subCategoryNamee}) {
    subCategoryName.value = subCategoryNamee;
  }

  void changerSubCategoryId({required int subcategoryIdd}) {
    subCategoryId.value = subcategoryIdd;
  }

  void changeSortingType({required String sortingTypee}) {
    sortingType.value = sortingTypee;
  }

  void changerCityId({required int cityIdd}) {
    cityId.value = cityIdd;
  }

  void changerPriceStart({required String priceSart}) {
    price_start.value = priceSart;
  }

  void changerPriceFinish({required String priceFinish}) {
    price_finish.value = priceFinish;
  }
}
