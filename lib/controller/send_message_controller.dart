import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/models/single_message_model.dart';

class SendMessageController extends GetxController {
  var isLoading = true.obs;
  var singleChatList = <Data>[];
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

  void sendFirstMessage(int roomId, String gettedId, String message) async {
    try {
      isLoading(true);
      var fetchFirst =
          await AllServices.sendMessage(getterId: gettedId, message: message);
      if (fetchFirst != null) {
        messageRoomId.value = fetchFirst.data.room.id;
      }
    } finally {
      isLoading(false);
    }
  }
}
