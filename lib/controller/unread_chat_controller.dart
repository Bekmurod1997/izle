import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/unread_message_model.dart';

class UnReadChatController extends GetxController {
  var isLoading = true.obs;
  var chatUnreadList = <Data>[];

  Future<void> fetchUnreadMessages() async {
    try {
      isLoading(true);
      var fetchUnreadChat = await AllServices.unreadMessages();
      if (fetchUnreadChat != null) {
        chatUnreadList.assignAll(fetchUnreadChat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
