import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

class TypeButtons extends StatelessWidget {
  const TypeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Text(
              'Бизнес',
              style: FontStyles.regularStyle(
                fontSize: 14,
                fontFamily: 'Lato',
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Text(
              'Состояния: новый',
              style: FontStyles.regularStyle(
                fontSize: 14,
                fontFamily: 'Lato',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
