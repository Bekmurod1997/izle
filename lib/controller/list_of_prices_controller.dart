import 'package:izle/models/list_of_price_model.dart';
import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';

class ListOfPriceController extends GetxController {
  var isLoading = true.obs;

  var listOfPrice = <Data>[];

  void fetchPrices() async {
    try {
      isLoading(true);
      var listPrice = await AllServices.allPrice();
      if (listPrice != null) {
        listOfPrice.assignAll(listPrice.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
