import 'package:izle/services/all_services.dart';
import 'package:izle/models/all_transaction_model.dart';
import 'package:get/get.dart';

class TransactionClickController extends GetxController {
  var isLoading = true.obs;
  var clickTransactionList = <Data>[];

  Future<void> fetchClickTransaction() async {
    try {
      isLoading(true);
      var clickTransaction = await AllServices.fetchClickTransaction();
      if (clickTransaction != null) {
        clickTransactionList.assignAll(clickTransaction.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
