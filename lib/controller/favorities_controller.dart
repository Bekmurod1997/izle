import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class FavoriteController extends GetxController {
  var isLoading = true.obs;
  var favoriteList = <Data>[];

  void fetchFavorites() async {
    try {
      isLoading(true);
      var favList = await AllServices.fetchFavorites();
      if (favList != null) {
        favoriteList.assignAll(favList.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
