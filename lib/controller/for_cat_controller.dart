import 'package:get/get.dart';

class ForSubCategoryController extends GetxController {
  var mainCatId = 1.obs;
  var subCatId = 1.obs;
  int? cityId;

  // void cityIdChanger(int value) {
  //   cityId.value = value;
  // }

  void mainCatIdChanger(int value) {
    mainCatId.value = value;
  }

  void subCatIdChanger(int value) {
    subCatId.value = value;
  }
}
