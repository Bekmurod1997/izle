import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';

class CallChatButtons extends StatelessWidget {
  const CallChatButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
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
          onTap: () {},
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
