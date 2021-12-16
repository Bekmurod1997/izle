import 'package:izle/services/all_services.dart';
import 'package:get/get.dart';
import 'package:izle/models/list_of_tarrifs_model.dart';

class ListOfTarrifsController extends GetxController {
  var isLoading = true.obs;
  var listOfTariffs = <Data>[];

  void fetchTarrifs() async {
    try {
      isLoading(true);
      var listT = await AllServices.listOfTariffs();

      if (listT != null) {
        listOfTariffs.assignAll(listT.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
