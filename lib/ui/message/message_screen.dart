import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/all_chat_controller.dart';
import 'package:izle/ui/components/custom_listTile2.dart';
import 'package:izle/ui/message/widgets/message_item.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final AllChatController allChatController = Get.put(AllChatController());

  bool istabed = false;
  var titles = [
    'Недавные',
    'Все отправленные',
    'Важные',
    'Архивные',
    'Непрочитанные',
    'Покупаю',
    'Продаю',
  ];
  @override
  void initState() {
    allChatController.fetchAllChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(30.0), // here the desired height
      //   child: AppBar(

      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     // leading: IconButton(
      //     //   padding: const EdgeInsets.only(left: 20),
      //     //   onPressed: () {},
      //     //   icon: SvgPicture.asset('assets/icons/ring.svg'),
      //     // ),
      //     // title: Text(
      //     //   'Сообщения',
      //     //   style: TextStyle(fontSize: 24, color: Colors.black),
      //     // ),
      //     actions: [
      //       GestureDetector(
      //         onTap: () {
      //           showModalBottomSheet(
      //               isScrollControlled: true,
      //               context: context,
      //               builder: (context) {
      //                 return StatefulBuilder(
      //                     builder: (context, StateSetter state) {
      //                   return FractionallySizedBox(
      //                     heightFactor: 0.9,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () => Get.back(),
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Text('X',
      //                                 style: TextStyle(
      //                                   fontSize: 25,
      //                                 )),
      //                           ),
      //                         ),
      //                         SizedBox(height: 15),
      //                         Padding(
      //                           padding:
      //                               const EdgeInsets.symmetric(horizontal: 10),
      //                           child: Text(
      //                             'Выберите собшения',
      //                             style: TextStyle(
      //                               fontSize: 30,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(height: 40),
      //                         Expanded(
      //                           child: ListView.builder(
      //                             padding: const EdgeInsets.symmetric(
      //                                 horizontal: 20),
      //                             itemCount: titles.length,
      //                             itemBuilder: (context, index) =>
      //                                 CustomListTile2(
      //                               istabed: istabed,
      //                               title: titles[index],
      //                               onpress: () {
      //                                 print('tabed$index');
      //                                 setState(() {
      //                                   istabed = !istabed;
      //                                 });
      //                               },
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 });
      //               });
      //         },
      //         child: Container(
      //           padding: const EdgeInsets.only(right: 20, top: 0),
      //           child: Text(
      //             'Фильтры',
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 15,
      //             ),
      //           ),
      //         ),
      //       ),

      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   // leading: IconButton(
      //   //   padding: const EdgeInsets.only(left: 20),
      //   //   onPressed: () {},
      //   //   icon: SvgPicture.asset('assets/icons/ring.svg'),
      //   // ),
      //   // title: Text(
      //   //   'Сообщения',
      //   //   style: TextStyle(fontSize: 24, color: Colors.black),
      //   // ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         showModalBottomSheet(
      //             isScrollControlled: true,
      //             context: context,
      //             builder: (context) {
      //               return StatefulBuilder(
      //                   builder: (context, StateSetter state) {
      //                 return FractionallySizedBox(
      //                   heightFactor: 0.9,
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       GestureDetector(
      //                         onTap: () => Get.back(),
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Text('X',
      //                               style: TextStyle(
      //                                 fontSize: 25,
      //                               )),
      //                         ),
      //                       ),
      //                       SizedBox(height: 15),
      //                       Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 10),
      //                         child: Text(
      //                           'Выберите собшения',
      //                           style: TextStyle(
      //                             fontSize: 30,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(height: 40),
      //                       Expanded(
      //                         child: ListView.builder(
      //                           padding:
      //                               const EdgeInsets.symmetric(horizontal: 20),
      //                           itemCount: titles.length,
      //                           itemBuilder: (context, index) =>
      //                               CustomListTile2(
      //                             istabed: istabed,
      //                             title: titles[index],
      //                             onpress: () {
      //                               print('tabed$index');
      //                               setState(() {
      //                                 istabed = !istabed;
      //                               });
      //                             },
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 );
      //               });
      //             });
      //       },
      //       child: Container(
      //         padding: const EdgeInsets.only(right: 30, top: 20),
      //         child: Text(
      //           'Фильтры',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

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
                SizedBox(height: 30),
                Divider(
                  color: ColorPalate.mainPageColor,
                  thickness: 3,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  height: 30,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Сообщение',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, StateSetter state) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('X',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                )),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Выберите собшения',
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
                                              istabed: istabed,
                                              title: titles[index],
                                              onpress: () {
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
                        child: Icon(Icons.filter_alt_sharp),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorPalate.mainPageColor,
                  thickness: 3,
                ),
                // GestureDetector(
                //   onTap: () {
                //     showModalBottomSheet(
                //         isScrollControlled: true,
                //         context: context,
                //         builder: (context) {
                //           return StatefulBuilder(
                //               builder: (context, StateSetter state) {
                //             return FractionallySizedBox(
                //               heightFactor: 0.9,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   GestureDetector(
                //                     onTap: () => Get.back(),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Text('X',
                //                           style: TextStyle(
                //                             fontSize: 25,
                //                           )),
                //                     ),
                //                   ),
                //                   SizedBox(height: 15),
                //                   Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 10),
                //                     child: Text(
                //                       'Выберите собшения',
                //                       style: TextStyle(
                //                         fontSize: 30,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(height: 40),
                //                   Expanded(
                //                     child: ListView.builder(
                //                       padding: const EdgeInsets.symmetric(
                //                           horizontal: 20),
                //                       itemCount: titles.length,
                //                       itemBuilder: (context, index) =>
                //                           CustomListTile2(
                //                         istabed: istabed,
                //                         title: titles[index],
                //                         onpress: () {
                //                           print('tabed$index');
                //                           setState(() {
                //                             istabed = !istabed;
                //                           });
                //                         },
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             );
                //           });
                //         });
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     padding: const EdgeInsets.only(right: 20, top: 0),
                //     child: Text(
                //       'Фильтры',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 15,
                //       ),
                //       textAlign: TextAlign.right,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: Text(
                //     'Сообщение',
                //     style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),

                SizedBox(height: 5),
                RefreshIndicator(
                  color: Colors.red,
                  onRefresh: () => allChatController.fetchAllChat(),
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
                                'Пока сообщений нет',
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
