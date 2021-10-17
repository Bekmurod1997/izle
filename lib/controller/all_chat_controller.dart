import 'package:get/get.dart';
import 'package:izle/models/all_message_model.dart';
import 'package:izle/services/all_services.dart';

class AllChatController extends GetxController {
  var isLoading = true.obs;
  var chatList = <Data>[];

  Future<void> fetchAllChat() async {
    try {
      isLoading(true);
      var fetChat = await AllServices.allMessages();
      if (fetChat != null) {
        chatList.assignAll(fetChat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
