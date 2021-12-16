import 'package:izle/services/all_services.dart';
import 'package:izle/models/complain_model.dart';
import 'package:get/get.dart';

class ComplainController extends GetxController {
  var isLoading = true.obs;
  var complatList = <Data>[].obs;

  void fetchComplains() async {
    try {
      isLoading(true);
      var compList = await AllServices.listOfComplains();
      if (compList != null) {
        complatList.assignAll(compList.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
