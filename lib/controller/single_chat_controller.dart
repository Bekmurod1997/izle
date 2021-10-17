import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/single_message_model.dart';

class SingleChatController extends GetxController {
  var isLoading = true.obs;
  var singleChatList = <Data>[];

  void fetchSingleChat(int chatId) async {
    try {
      isLoading(true);
      var fetchChat = await AllServices.singleMessage(messageId: chatId);
      if (fetchChat != null) {
        singleChatList.assignAll(fetchChat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
