import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/api.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/controller/single_chat_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/utils/my_prefs.dart';

class SingleScreen extends StatefulWidget {
  final int chatId;
  final int getterId;
  final String userName;
  final String imageUrl;

  SingleScreen({
    required this.chatId,
    required this.getterId,
    required this.userName,
    required this.imageUrl,
  });
  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  final SingleChatController singleChatController =
      Get.put(SingleChatController());
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    singleChatController.fetchSingleChat(widget.chatId);
    print('---');
    print(MyPref.userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: Obx(() {
        if (singleChatController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    color: Colors.white,
                    // padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 3,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: SvgPicture.asset(
                                        'assets/icons/next-icon.svg',
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    child: Image.network(
                                      ApiUrl.izleUrl + widget.imageUrl,
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // 'Азиз Ассомов',
                                        widget.userName,
                                        style: FontStyles.boldStyle(
                                          fontSize: 24,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                      Text(
                                        'был(а) вчера 19:35',
                                        style: FontStyles.regularStyle(
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          color: Color(0xff616161),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                // padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                                itemBuilder: (context) => <PopupMenuEntry>[
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text("Пометить как важное"),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text("Архивировать"),
                                  ),
                                  PopupMenuItem(
                                    value: 3,
                                    child: Text("Удалить"),
                                  ),
                                  PopupMenuDivider(
                                    height: 14,
                                  ),
                                  PopupMenuItem(
                                    value: 4,
                                    child: Text("Все объявления автора"),
                                  ),
                                  PopupMenuItem(
                                    value: 5,
                                    child: Text("Заблокировать"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.white,
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Продам Chevrolet Lacetti',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '90 000 000 сум',
                            style: FontStyles.boldStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        'ID: 12345678',
                        style: FontStyles.regularStyle(
                          fontSize: 10,
                          color: Color(0xff616161),
                          fontFamily: 'Lato',
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/next-icon.svg',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        reverse: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: singleChatController.singleChatList.length,
                        // itemCount: singleChatController.singleChatList.length,
                        itemBuilder: (context, index) => singleChatController
                                    .singleChatList[index].sender?.name !=
                                MyPref.userName
                            ? Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 20,
                                              right: 20),
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                              bottomRight: Radius.circular(6),
                                            ),
                                          ),
                                          child: Text(
                                            // 'Не могли бы вы написать в телеграм +998901234567 обсудим',
                                            singleChatController
                                                .singleChatList[index].message!,
                                            style: FontStyles.regularStyle(
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 3,
                                          right: 10,
                                          child: Text(
                                            '17:05',
                                            style: FontStyles.regularStyle(
                                                fontSize: 12,
                                                fontFamily: 'Lato',
                                                color: Color(0xff7F807F)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: 5),
                                    // Text(
                                    //   '17:35',
                                    //   style: FontStyles.regularStyle(
                                    //       fontSize: 12,
                                    //       fontFamily: 'Lato',
                                    //       color: Color(0xff7F807F)),
                                    // ),
                                  ],
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 20,
                                              right: 20),
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Color(0xffCDDCFE),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                              bottomLeft: Radius.circular(6),
                                            ),
                                          ),
                                          child: Text(
                                            // 'Хорошо по позже перезвоню!',
                                            singleChatController
                                                .singleChatList[index].message!,
                                            style: FontStyles.regularStyle(
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 7,
                                          right: 10,
                                          child: Row(
                                            children: [
                                              Text(
                                                '17:35 ',
                                                style: FontStyles.regularStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Lato',
                                                    color: Color(0xff7F807F)),
                                              ),
                                              SizedBox(width: 4),
                                              SvgPicture.asset(
                                                singleChatController
                                                            .singleChatList[
                                                                index]
                                                            .status ==
                                                        1
                                                    ? 'assets/icons/Shape.svg'
                                                    : 'assets/icons/one_tick.svg',
                                                width: 18,
                                                color: Color(0xff5493FF),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: 5),
                                    // Text(
                                    //   '17:35',
                                    //   style: FontStyles.regularStyle(
                                    //       fontSize: 12,
                                    //       fontFamily: 'Lato',
                                    //       color: Color(0xff7F807F)),
                                    // ),
                                  ],
                                ),
                              )

                        // SizedBox(height: 10),

                        // Container(
                        //   width: double.infinity,
                        //   padding: const EdgeInsets.only(right: 20),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.end,
                        //     children: [
                        //       Stack(
                        //         children: [
                        //           Container(
                        //             padding: const EdgeInsets.only(
                        //                 top: 10,
                        //                 bottom: 10,
                        //                 left: 20,
                        //                 right: 20),
                        //             width: 300,
                        //             decoration: BoxDecoration(
                        //               color: Color(0xffCDDCFE),
                        //               borderRadius: BorderRadius.only(
                        //                 topLeft: Radius.circular(6),
                        //                 topRight: Radius.circular(6),
                        //                 bottomLeft: Radius.circular(6),
                        //               ),
                        //             ),
                        //             child: Text(
                        //               'Хорошо по позже перезвоню!',
                        //               style: FontStyles.regularStyle(
                        //                 fontSize: 14,
                        //                 fontFamily: 'Lato',
                        //               ),
                        //             ),
                        //           ),
                        //           Positioned(
                        //             bottom: 7,
                        //             right: 10,
                        //             child: Row(
                        //               children: [
                        //                 Text(
                        //                   '17:35',
                        //                   style: FontStyles.regularStyle(
                        //                       fontSize: 12,
                        //                       fontFamily: 'Lato',
                        //                       color: Color(0xff7F807F)),
                        //                 ),
                        //                 SizedBox(width: 4),
                        //                 SvgPicture.asset(
                        //                   'assets/icons/Shape.svg',
                        //                   color: Color(0xff5493FF),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       // SizedBox(height: 5),
                        //       // Text(
                        //       //   '17:35',
                        //       //   style: FontStyles.regularStyle(
                        //       //       fontSize: 12,
                        //       //       fontFamily: 'Lato',
                        //       //       color: Color(0xff7F807F)),
                        //       // ),
                        //     ],
                        //   ),
                        // ),

                        // SizedBox(height: 10),
                        ),
                  ),
                  SizedBox(height: 25),
                  // SizedBox(height: 10),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(bottom: 0),
                  color: Colors.white,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 14),
                      // Container(
                      //   width: 30,
                      //   child: Icon(
                      //     Icons.attach_file,
                      //     color: Color(0xff112F2E),
                      //   ),
                      // ),
                      // Container(
                      //   width: 30,
                      //   child: SvgPicture.asset(
                      //     'assets/icons/maps-and-flags.svg',
                      //     height: 20,
                      //     color: Color(0xff112F2E),
                      //   ),
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 70,
                            height: 30,
                            // color: Colors.yellow,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: new BorderRadius.circular(15.0),
                            //   border: Border.all(color: Colors.black),
                            // ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 0, bottom: 0),
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  // contentPadding: EdgeInsets.only(bottom: 0),
                                  // border: InputBorder.none,
                                  hintText: 'Напишите сообщение',
                                  hintStyle: FontStyles.regularStyle(
                                      fontSize: 16,
                                      fontFamily: 'Lato',
                                      color: Color(0xff616161)),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () async {
                              await AllServices.sendMessage(
                                  getterId: widget.getterId.toString(),
                                  message: messageController.text);
                              singleChatController
                                  .fetchSingleChat(widget.chatId);
                              messageController.text = '';
                            },
                            icon: Icon(
                              Icons.send,
                              color: Color(0xff347EE4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
