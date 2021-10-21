import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/api.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/message/widgets/single_message.dart';

class MessageItem extends StatelessWidget {
  final int? id;
  final String? userName;
  final String? imageUrl;
  final String? date;
  final String? lastMessage;
  final int? getterId;
  final int? messageCount;
  MessageItem(
      {this.id,
      this.userName,
      this.imageUrl,
      this.date,
      this.lastMessage,
      this.messageCount,
      this.getterId});
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // pageNavigationController.pageControllerChanger(7);
        Get.to(() => SingleScreen(
              chatId: id!,
              getterId: getterId!,
              userName: userName!,
              imageUrl: imageUrl!,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        margin: EdgeInsets.only(
          bottom: 5,
          left: 12,
          right: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Container(
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    child: Image.network(ApiUrl.izleUrl + imageUrl!),
                    // child: Image.asset('assets/images/person.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Шахзод',
                        userName!,
                        style: FontStyles.regularStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        // 'Sorry, I’m unlisting it',
                        lastMessage!,
                        style: FontStyles.regularStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Color(0xff827878),
                        ),
                      ),
                      // Text(getterId.toString()),
                    ],
                  ),
                ],
              ),
              messageCount != 0
                  ? Positioned(
                      bottom: 0,
                      right: 10,
                      child: Column(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Text(
                              messageCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '4:12',
                            // date!,
                            style: FontStyles.thinStyle(
                              fontSize: 12,
                              fontFamily: 'Lato',
                              color: Color(0xff828282),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
