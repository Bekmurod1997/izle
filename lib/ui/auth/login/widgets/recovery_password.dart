import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/mask/mask_format.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/auth/login/widgets/confirm_to_recovery.dart';

class RecovryPasswordScreen extends StatefulWidget {
  @override
  _RecovryPasswordScreenState createState() => _RecovryPasswordScreenState();
}

class _RecovryPasswordScreenState extends State<RecovryPasswordScreen> {
  final TextEditingController phoneNumber = TextEditingController();
  String errorMessage = '';
  void validatePhoneNumber() async {
    if (phoneNumber.text.length > 15) {
      await AllServices.recoveryPassword(phoneNumber.text.replaceAll(' ', ''));
      // Get.to(() =>
      //     ConfirmToRecovery(phoneNumber: phoneNumber.text.replaceAll(' ', '')));
    }
    if (phoneNumber.text.length > 0 && phoneNumber.text.length < 16) {
      setState(() {
        errorMessage = 'pleaseGiveCorrectPhone'.tr;
      });
    }
    if (phoneNumber.text.length == 0) {
      setState(() {
        errorMessage = 'pleaseFillPhoneFiled'.tr;
      });
    }
    if (phoneNumber.text.length == 16) {
      setState(() {
        errorMessage = '';
      });
    }
  }

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
                Text(
                  'recoveryPassowrd'.tr,
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
                'pleaseFillPhoneFiled'.tr,
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
                  onChanged: (value) {
                    print(value.length);
                  },
                  inputFormatters: [InputMask.maskPhoneNumber],
                  keyboardType: TextInputType.phone,
                  controller: phoneNumber,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '998'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                errorMessage,
                style: TextStyle(fontSize: 11, color: Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () {
                validatePhoneNumber();
                // await AllServices.recoveryPassword(
                //     phoneNumber.text.replaceAll(' ', ''));
                // Get.to(() => ConfirmToRecovery(
                //     phoneNumber: phoneNumber.text.replaceAll(' ', '')));
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
                    'next'.tr,
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
