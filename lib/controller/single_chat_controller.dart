import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/single_message_model.dart';

class SingleChatController extends GetxController {
  var file = ''.obs;
  var isLoading = true.obs;
  var singleChatList = <Data>[];
  var firstMessageList = <Data>[];
  var messageRoomId = 1.obs;

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

  Future<void> fetchFirstMessage(
      // int roomId,
      String gettedId,
      String message) async {
    try {
      isLoading(true);
      var fetchFirst =
          await AllServices.sendMessage(getterId: gettedId, message: message);
      if (fetchFirst != null) {
        firstMessageList.assignAll(fetchFirst.data);
        // messageRoomId.value = fetchFirst.data.room.id;
      }
    } finally {
      isLoading(false);
    }
  }
}
