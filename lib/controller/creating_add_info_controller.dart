import 'package:get/get.dart';

class CreatingAddInfoController extends GetxController {
  var mainCategory = 'nothing'.obs;
  var subCategory = 'nothing'.obs;
  var subCategoryId = 1.obs;
  var description = 'nothing'.obs;
  var title = 'nothing'.obs;
  var lat = 0.0.obs;
  var long = 0.0.obs;
  var locationInfo = 'nowhere'.obs;
  var typeId = 0.obs;
  var name = 'nobody'.obs;
  var price = 0.0.obs;

  void allClear() {
    mainCategory.value = 'nothing';
    subCategory.value = 'nothing';
    subCategoryId.value = 1;
    description.value = 'nothing';
    title.value = 'nothing';
    lat.value = 0.0;
    long.value = 0.0;
    locationInfo.value = 'nowhere';
    typeId.value = 0;
    name.value = 'nobody';
    price.value = 0.0;
  }

  void nameChanger(String nameC) {
    name.value = nameC;
  }

  void priceChanger(double priceC) {
    price.value = priceC;
  }

  void typeIdChanger(int id) {
    typeId.value = id;
  }

  void locationInfoChanger(String locInfo) {
    locationInfo.value = locInfo;
  }

  void titleChanger({String? titlee}) {
    title.value = titlee!;
  }

  void landAndLongChanger(double latitude, double longitude) {
    lat.value = latitude;
    long.value = longitude;
  }

  void mainCategoryChanger({String? categoryName}) {
    mainCategory.value = categoryName!;
  }

  Future subCategoryChanger(
      {required String subCategoryName, required int id}) async {
    subCategory.value = subCategoryName;
    subCategoryId.value = id;
  }

  void descriptionChanger({required String descriptionn}) {
    description.value = descriptionn;
  }
}
