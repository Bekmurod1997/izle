import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/all_chat_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/unread_chat_controller.dart';
import 'package:izle/ui/components/custom_listTile2.dart';
import 'package:izle/ui/message/widgets/message_item.dart';
import 'package:izle/ui/nav.dart';

class MessageScreen extends StatefulWidget {
  final String? messageType;
  MessageScreen(this.messageType);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  final AllChatController allChatController = Get.find<AllChatController>();
  final UnReadChatController unReadChatController =
      Get.find<UnReadChatController>();

  bool istabed = false;
  var titles = [
    'allMessages'.tr,
    'important'.tr,
    'archive'.tr,
    'blocked'.tr,
    'unreaded'.tr,
  ];
  @override
  void initState() {
    print('messagee type');
    print(allChatController.messageType.value);
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      print('this is initstate in emssageScreen');
      allChatController.fetchAllChat(allChatController.messageType.value);
      unReadChatController.fetchUnreadMessages();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'message'.tr,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (context, StateSetter state) {
                        return FractionallySizedBox(
                          heightFactor: 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('X',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'chooseMessage'.tr,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  itemCount: titles.length,
                                  itemBuilder: (context, index) =>
                                      CustomListTile2(
                                    istabed: false,
                                    title: titles[index],
                                    onpress: () {
                                      index == 0
                                          ? allChatController
                                              .messageType.value = ''
                                          : index == 1
                                              ? allChatController.messageType
                                                  .value = 'important'
                                              : index == 2
                                                  ? allChatController
                                                      .messageType
                                                      .value = 'archive'
                                                  : index == 3
                                                      ? allChatController
                                                          .messageType
                                                          .value = 'block'
                                                      : allChatController
                                                          .messageType
                                                          .value = 'unreaded';
                                      allChatController.fetchAllChat(index == 0
                                          ? ''
                                          : index == 1
                                              ? 'important'
                                              : index == 2
                                                  ? 'archive'
                                                  : index == 3
                                                      ? 'block'
                                                      : 'unreaded');
                                      Get.back();
                                      // Get.back();
                                      // Get.offAll(() => NavScreen());
                                      // pageNavigationController
                                      //     .pageControllerChanger(3);
                                      // pageNavigationController
                                      //     .tabIndexChanger(3);
                                      // Get.back();
                                      // Get.back();
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             MessageScreen(index == 0
                                      //                 ? ''
                                      //                 : index == 1
                                      //                     ? 'imporant'
                                      //                     : index == 2
                                      //                         ? 'archive'
                                      //                         : 'block')));
                                      print('tabed$index');
                                      setState(() {
                                        istabed = !istabed;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    });
              },
              child: Icon(
                Icons.filter_alt_sharp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (allChatController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
            ),
          );
        } else {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                RefreshIndicator(
                  // color: Colors.red,
                  onRefresh: () =>
                      allChatController.fetchAllChat(widget.messageType),
                  child: allChatController.chatList.length == 0
                      ? Container(
                          child: Column(
                            children: [
                              SizedBox(height: 80),
                              Center(
                                child: Image.asset('assets/images/smms.png'),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'youHaveNotMessage'.tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2E3A59),
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allChatController.chatList.length,
                          itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.only(top: 0),
                              child: MessageItem(
                                id: allChatController.chatList[index].id,
                                date: allChatController.chatList[index].date,
                                imageUrl:
                                    allChatController.chatList[index].photo,
                                lastMessage: allChatController
                                    .chatList[index].lastMessage,
                                userName:
                                    allChatController.chatList[index].name,
                                getterId:
                                    allChatController.chatList[index].userId,
                                messageCount:
                                    allChatController.chatList[index].messages,
                              )),
                        ),
                ),
              ],
            ),
          );
        }
      }),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
