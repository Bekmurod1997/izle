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

  void nameChanger(String nameC) {
    name.value = nameC;
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

  void subCategoryChanger({String? subCategoryName, required int? id}) {
    subCategory.value = subCategoryName!;
    subCategoryId.value = id!;
  }

  void descriptionChanger({required String descriptionn}) {
    description.value = descriptionn;
  }
}
