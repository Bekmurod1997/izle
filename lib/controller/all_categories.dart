import 'package:izle/models/categories/main_categories_model.dart';
import 'package:get/get.dart';
import 'package:izle/services/main_categories_servies.dart';

class MainCategories extends GetxController {
  var isLoading = true.obs;
  var categoriesList = <Data>[];
  @override
  void onInit() {
    fetchMainCategries();
    super.onInit();
  }

  void fetchMainCategries() async {
    try {
      isLoading(true);
      var fetchCat = await MainCategoriesService.fetchMainCategories();
      if (fetchCat != null) {
        categoriesList.assignAll(fetchCat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
