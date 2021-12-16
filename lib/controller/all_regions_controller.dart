import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/all_regions_model.dart';

class AllRegionsController extends GetxController{
  var isLoading = true.obs;
  var allRegionsList = <DataRegions>[];

  void fetchAllRegions() async {
    try{
      isLoading(true);
      var fetchRegions = await AllServices.allRegions();
      if(fetchRegions != null){
       allRegionsList.assignAll(fetchRegions.data);
      }
    } finally {
      isLoading(false);
    }
  }
}