import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/api.dart';
import 'package:izle/controller/all_chat_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/controller/single_chat_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

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
      Get.find<SingleChatController>();
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  TextEditingController messageController = TextEditingController();

  final AllChatController allChatController = Get.find<AllChatController>();

  @override
  void initState() {
    singleChatController.fetchSingleChat(widget.chatId);
    print('---');
    print(MyPref.userName);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        allChatController.fetchAllChat('');
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorPalate.mainPageColor,
        body: Obx(() {
          if (singleChatController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Divider(
                          //   thickness: 3,
                          // ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 10),
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
                                          widget.userName,
                                          style: FontStyles.boldStyle(
                                            fontSize: 24,
                                            fontFamily: 'Lato',
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
                                      onTap: () {
                                        AllServices.messageSetImportant(
                                          widget.chatId.toString(),
                                          singleChatController.singleChatList
                                              .first.room!.importantStatus!,
                                        );
                                        singleChatController
                                            .fetchSingleChat(widget.chatId);
                                      },
                                      value: 1,
                                      child: Text(singleChatController
                                                  .singleChatList
                                                  .first
                                                  .room!
                                                  .importantStatus ==
                                              1
                                          ? "toUnImportant".tr
                                          : "toMakeImporant".tr),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        AllServices.messageArchive(
                                          widget.chatId.toString(),
                                          singleChatController.singleChatList
                                              .first.room!.archiveStatus!,
                                        );
                                        singleChatController
                                            .fetchSingleChat(widget.chatId);
                                      },
                                      value: 2,
                                      child: Text(singleChatController
                                                  .singleChatList
                                                  .first
                                                  .room!
                                                  .archiveStatus ==
                                              1
                                          ? "toUnarchive".tr
                                          : "archive".tr),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        AllServices.deleteMessage(
                                            widget.chatId.toString());
                                      },
                                      value: 3,
                                      child: Text("delete".tr),
                                    ),
                                    PopupMenuDivider(
                                      height: 14,
                                    ),
                                    // PopupMenuItem(
                                    //   onTap: () {
                                    //     print('ss');
                                    //   },
                                    //   value: 4,
                                    //   child: GestureDetector(
                                    //       onTap: () {
                                    //         print('ddd');
                                    //         Get.to(() => AdsByAuthor(
                                    //               userId: widget.getterId,
                                    //             ));
                                    //       },
                                    //       child: Text("Все объявления автора")),
                                    // ),
                                    PopupMenuItem(
                                      onTap: () {
                                        AllServices.blockUser(
                                          widget.chatId.toString(),
                                          singleChatController.singleChatList
                                              .first.room!.status!,
                                        );
                                        singleChatController
                                            .fetchSingleChat(widget.chatId);
                                      },
                                      value: 5,
                                      child: Text(singleChatController
                                                  .singleChatList
                                                  .first
                                                  .room!
                                                  .status ==
                                              1
                                          ? "toUnblock".tr
                                          : "toBlock".tr),
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
                    Expanded(
                      child: ListView.separated(
                          reverse: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: singleChatController.singleChatList.length,
                          itemBuilder: (context, index) => singleChatController
                                      .singleChatList[index].sender?.name !=
                                  MyPref.userName
                              ? Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(6),
                                                bottomLeft: Radius.circular(6),
                                              ),
                                            ),
                                            child: singleChatController
                                                        .singleChatList[index]
                                                        .message ==
                                                    null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      openFile(
                                                          url: 'http://izle.uz/' +
                                                              singleChatController
                                                                  .singleChatList[
                                                                      index]
                                                                  .filePath!);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Image.network(
                                                        'http://izle.uz/' +
                                                            singleChatController
                                                                .singleChatList[
                                                                    index]
                                                                .filePath!,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                            color: Colors.red,
                                                          ));
                                                        },
                                                      ),
                                                      // Text(
                                                      //   'Фото',
                                                      //   style: TextStyle(
                                                      //       fontSize: 19,
                                                      //       fontWeight:
                                                      //           FontWeight.bold,
                                                      //       color: Colors.black),
                                                      // ),
                                                    ),
                                                  )
                                                : Text(
                                                    singleChatController
                                                        .singleChatList[index]
                                                        .message!,
                                                    style:
                                                        FontStyles.regularStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Lato',
                                                    ),
                                                  ),
                                          ),
                                          Positioned(
                                            bottom: 3,
                                            right: 10,
                                            child: Text(
                                              singleChatController
                                                  .singleChatList[index].date!
                                                  .substring(
                                                      singleChatController
                                                              .singleChatList[
                                                                  index]
                                                              .date!
                                                              .length -
                                                          8),
                                              style: FontStyles.regularStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  color: Color(0xff7F807F)),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                            child: singleChatController
                                                        .singleChatList[index]
                                                        .message ==
                                                    null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      openFile(
                                                          url: 'http://izle.uz/' +
                                                              singleChatController
                                                                  .singleChatList[
                                                                      index]
                                                                  .filePath!);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Image.network(
                                                        'http://izle.uz/' +
                                                            singleChatController
                                                                .singleChatList[
                                                                    index]
                                                                .filePath!,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                            color: Colors.red,
                                                          ));
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    singleChatController
                                                        .singleChatList[index]
                                                        .message!,
                                                    style:
                                                        FontStyles.regularStyle(
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
                                                  singleChatController
                                                      .singleChatList[index]
                                                      .date!
                                                      .substring(
                                                          singleChatController
                                                                  .singleChatList[
                                                                      index]
                                                                  .date!
                                                                  .length -
                                                              8),
                                                  style:
                                                      FontStyles.regularStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          color: Color(
                                                              0xff7F807F)),
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
                                    ],
                                  ),
                                )),
                    ),
                    SizedBox(height: 55),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
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
                            await AllServices.sendMessageFile(
                                getterId: widget.getterId.toString(),
                                fileName: file.path.toString());
                            Get.back();
                            singleChatController.fetchSingleChat(widget.chatId);
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
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 0, bottom: 0),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
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
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFile(url, name);
    if (file == null) return null;
    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      print('error in resume');
      print(e);
      return null;
    }
  }
}
