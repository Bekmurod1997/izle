import 'package:izle/services/all_services.dart';
import 'package:izle/models/all_transaction_model.dart';
import 'package:get/get.dart';

class TransactionPaymeController extends GetxController {
  var isLoading = true.obs;
  var paymeTransactionList = <Data>[];

  Future<void> fetchPaymeTransaction() async {
    try {
      isLoading(true);
      var paymeTransaction = await AllServices.fetchPaymeTransaction();
      if (paymeTransaction != null) {
        paymeTransactionList.assignAll(paymeTransaction.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
