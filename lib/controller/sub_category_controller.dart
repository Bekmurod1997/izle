import 'package:izle/models/categories/main_categories_model.dart';
import 'package:get/get.dart';
import 'package:izle/services/sub_category.dart';

class SubCategoryController extends GetxController {
  var isLoading = true.obs;
  var subCategoryList = <Data>[];
  @override
  void onInit() {
    // fetchSubCategries(id);
    super.onInit();
  }

  void fetchSubCategries(int id) async {
    try {
      isLoading(true);
      var fetchCat = await SubCategoryService.fetchSubCategories(id);
      if (fetchCat != null) {
        subCategoryList.assignAll(fetchCat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
