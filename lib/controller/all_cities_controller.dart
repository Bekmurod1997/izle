import 'package:get/get.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/services/all_services.dart';

class AllCityController extends GetxController {
  var isLoading = true.obs;
  var cityList = <Data>[];
  @override
  void onInit() {
    fetchMainCategries();
    super.onInit();
  }

  void fetchMainCategries() async {
    try {
      isLoading(true);
      var fetchCities = await AllServices.allCities();
      if (fetchCities != null) {
        cityList.assignAll(fetchCities.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
