import 'package:get/get.dart';
import 'package:izle/models/all_message_model.dart';
import 'package:izle/services/all_services.dart';

class AllChatController extends GetxController {
  var isLoading = true.obs;
  var chatList = <Data>[];
  var messageType = ''.obs;
  // var importantList = <Data>[];
  // var archiveList = <Data>[];
  // var blocktList = <Data>[];
  // var unReadList = <Data>[];

  Future<void> fetchAllChat(String? messageType) async {
    try {
      isLoading(true);
      var fetChat = await AllServices.allMessages(messageType);
      if (fetChat != null) {
        chatList.assignAll(fetChat.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
