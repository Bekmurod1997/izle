import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/message/widgets/first_message.dart';

class CallChatButtons extends StatefulWidget {
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
  State<CallChatButtons> createState() => _CallChatButtonsState();
}

class _CallChatButtonsState extends State<CallChatButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          // onTap: () => setState(() {
          //   _launched = _makePhoneCall('tel:+0090000');
          // }),
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
                  imageUrl: widget.imageUrl,
                  userId: widget.userId,
                  userName: widget.userName,
                  userPhone: widget.userPhone,
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
