import 'package:get/get.dart';

class FilterSecondController extends GetxController {
  var cityName = ''.obs;
  var cityId = 0.obs;

  var mainCategoryName = ''.obs;
  var mainCategoryId = 0.obs;

  var subCategoryId = 0.obs;
  var subCategorName = ''.obs;

  void changerCiityId({required int id}) {
    cityId.value = id;
  }

  void changerCiityName({required String name}) {
    cityName.value = name;
  }

  void changerSubcateegoryId({required int id}) {
    subCategoryId.value = id;
  }

  void changerSubcateegoryName({required String name}) {
    subCategorName.value = name;
  }
}
