import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/api.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/single_chat_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/message/widgets/single_message.dart';
import 'package:izle/ui/nav.dart';

class FirstMessageScreen extends StatefulWidget {
  final int? userId;
  final String? userPhone;
  final String? userName;
  final String? imageUrl;
  final int? roomId;
  FirstMessageScreen({
    this.userId,
    this.userPhone,
    this.userName,
    this.imageUrl,
    this.roomId,
  });
  @override
  _FirstMessageScreenState createState() => _FirstMessageScreenState();
}

class _FirstMessageScreenState extends State<FirstMessageScreen> {
  SingleChatController singleChatController = Get.find<SingleChatController>();
  TextEditingController messageController = TextEditingController();
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: Stack(
        children: [
          Column(
            children: [
              Divider(
                thickness: 3,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
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
                            ApiUrl.izleUrl + widget.imageUrl!,
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // '???????? ??????????????',
                              widget.userName!,
                              style: FontStyles.boldStyle(
                                fontSize: 24,
                                fontFamily: 'Lato',
                              ),
                            ),
                            // Text(
                            //   '??????(??) ?????????? 19:35',
                            //   style: FontStyles.regularStyle(
                            //     fontSize: 14,
                            //     fontFamily: 'Roboto',
                            //     color: Color(0xff616161),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    // PopupMenuButton(
                    //   // padding: EdgeInsets.zero,
                    //   icon: Icon(
                    //     Icons.more_vert,
                    //     size: 30,
                    //   ),
                    //   itemBuilder: (context) => <PopupMenuEntry>[
                    //     PopupMenuItem(
                    //       value: 1,
                    //       child: Text("???????????????? ?????? ????????????"),
                    //     ),
                    //     PopupMenuItem(
                    //       value: 2,
                    //       child: Text("????????????????????????"),
                    //     ),
                    //     PopupMenuItem(
                    //       value: 3,
                    //       child: Text("??????????????"),
                    //     ),
                    //     PopupMenuDivider(
                    //       height: 14,
                    //     ),
                    //     PopupMenuItem(
                    //       value: 4,
                    //       child: Text("?????? ???????????????????? ????????????"),
                    //     ),
                    //     PopupMenuItem(
                    //       value: 5,
                    //       child: Text("??????????????????????????"),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  GestureDetector(
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                      );
                      if (result == null) return;
                      final file = result.files.first;
                      print('Name:${file.name} ');
                      print('Byte:${file.bytes} ');
                      print('Size:${file.size} ');
                      print('Extension:${file.extension} ');
                      print('Path:${file.path} ');
                      await AllServices.sendMessageFileFirstTime(
                          getterId: widget.userId.toString(),
                          fileName: file.path.toString());

                      // singleChatController.fetchSingleChat(widget.chatId);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: Icon(
                        Icons.attach_file,
                        color: Color(0xff112F2E),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 0, bottom: 0),
                          child: TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'writeMessage'.tr,
                              hintStyle: FontStyles.regularStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: Color(0xff616161)),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(right: 0),
                        onPressed: () async {
                          await AllServices.sendMessage(
                              getterId: widget.userId.toString(),
                              message: messageController.text);
                          // singleChatController
                          //     .fetchSingleChat(widget.chatId);
                          messageController.text = '';
                          Get.to(() => NavScreen());
                          pageNavigationController.pageControllerChanger(3);
                          pageNavigationController.tabIndexChanger(3);
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

          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     padding: const EdgeInsets.only(bottom: 0),
          //     color: Colors.white,
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         SizedBox(width: 14),
          //         // Container(
          //         //   width: 30,
          //         //   child: Icon(
          //         //     Icons.attach_file,
          //         //     color: Color(0xff112F2E),
          //         //   ),
          //         // ),
          //         // Container(
          //         //   width: 30,
          //         //   child: SvgPicture.asset(
          //         //     'assets/icons/maps-and-flags.svg',
          //         //     height: 20,
          //         //     color: Color(0xff112F2E),
          //         //   ),
          //         // ),
          //         Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Container(
          //               width: MediaQuery.of(context).size.width - 70,
          //               height: 30,
          //               // color: Colors.yellow,
          //               // decoration: BoxDecoration(
          //               //   color: Colors.white,
          //               //   borderRadius: new BorderRadius.circular(15.0),
          //               //   border: Border.all(color: Colors.black),
          //               // ),
          //               child: Padding(
          //                 padding: EdgeInsets.only(
          //                     left: 15, right: 15, top: 0, bottom: 0),
          //                 child: TextFormField(
          //                   controller: messageController,
          //                   decoration: InputDecoration(
          //                     focusedBorder: InputBorder.none,
          //                     enabledBorder: InputBorder.none,
          //                     // contentPadding: EdgeInsets.only(bottom: 0),
          //                     // border: InputBorder.none,
          //                     hintText: '???????????????? ??????????????????',
          //                     hintStyle: FontStyles.regularStyle(
          //                         fontSize: 16,
          //                         fontFamily: 'Lato',
          //                         color: Color(0xff616161)),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             IconButton(
          //               padding: const EdgeInsets.only(right: 10),
          //               onPressed: () async {
          //                 // await AllServices.sendMessage(
          //                 //     getterId: widget.userId.toString(),
          //                 //     message: messageController.text);
          //                 await singleChatController.fetchFirstMessage(
          //                     widget.userId.toString(), messageController.text);
          //                 singleChatController.firstMessageList.first.room!.id!;
          //                 // Get.to(() => MessageScreen());
          //                 Get.off(() => SingleScreen(
          //                     chatId: singleChatController
          //                         .firstMessageList.first.room!.id!,
          //                     getterId: widget.userId!,
          //                     userName: widget.userName!,
          //                     imageUrl: widget.imageUrl!));
          //               },
          //               icon: Icon(
          //                 Icons.send,
          //                 color: Color(0xff347EE4),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
