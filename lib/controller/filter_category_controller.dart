import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/filter_model.dart';

class FilterCategoryController extends GetxController {
  var isLoading = false.obs;
  var filterList = <Data>[];

  Future<void> fetchFilterCategories({required String id}) async {
    try {
      isLoading(true);
      var filters = await AllServices.filterService(id: id);
      if (filters != null) {
        filterList.assignAll(filters.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
