import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/nav.dart';

class ConfirmToRecovery extends StatefulWidget {
  final String phoneNumber;
  ConfirmToRecovery({required this.phoneNumber});
  @override
  _ConfirmToRecoveryState createState() => _ConfirmToRecoveryState();
}

class _ConfirmToRecoveryState extends State<ConfirmToRecovery> {
  final TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 3),
            Row(
              children: [
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      'assets/icons/next-icon.svg',
                      height: 20,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Восстановление пароля',
                  style: FontStyles.boldStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Text(
                'Введите свой code*',
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Color(0xff80858C),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: code,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'vedite code'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                AllServices.recoveryCodePassword(widget.phoneNumber, code.text);
                Get.to(() => NavScreen());
              },
              // Get.to(
              //   () => CreatingAddScreen(),
              // ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(
                  top: 31,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: ColorPalate.mainColor,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Podverdit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
