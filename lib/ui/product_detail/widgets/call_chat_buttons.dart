import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/message/widgets/first_message.dart';

class CallChatButtons extends StatelessWidget {
  final int? userId;
  final String? userPhone;
  final String? userName;
  final String? imageUrl;
  CallChatButtons({
    this.userId,
    this.userPhone,
    this.userName,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            print(userPhone);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 50,
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(
                  color: ColorPalate.mainColor,
                  width: 2,
                )),
            child: Center(
              child: Text(
                'Позвонить',
                style: TextStyle(
                  fontSize: 18,
                  color: ColorPalate.mainColor,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => FirstMessageScreen(
                  imageUrl: imageUrl,
                  userId: userId,
                  userName: userName,
                  userPhone: userPhone,
                ));
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 50,
            padding: const EdgeInsets.symmetric(vertical: 11),
            decoration: BoxDecoration(
              color: ColorPalate.mainColor,
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Сообщение',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
