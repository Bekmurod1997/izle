import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/pdetail.dart';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  ExampleProductDetail? productDetailList;

  Future<void> fetchProductDetail(int proId) async {
    try {
      isLoading(true);
      var proList = await AllServices.productDetail(proId);
      if (proList != null) {
        productDetailList = proList;
        print('this is controller product detail');
        print(productDetailList);
      }
    } catch (e) {
      print('error in controller');
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
