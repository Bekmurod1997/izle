import 'package:get/get.dart';
import 'package:izle/models/all_categories_model.dart';
import 'package:izle/services/all_services.dart';

class FinalAllCategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <Data>[];

  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

  void fetchAllCategories() async {
    try {
      isLoading(true);
      var fetchCat = await AllServices.allCategories();
      if (fetchCat != null) {
        categoryList.assignAll(fetchCat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
