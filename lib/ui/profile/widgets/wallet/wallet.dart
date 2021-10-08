import 'package:flutter/material.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/profile/widgets/wallet/fill_up_wallet.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'Ваш кошелек'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/wallet.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/circular.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ваш баланс:',
                        style: FontStyles.mediumStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '25 500 UZS:',
                        style: FontStyles.mediumStyle(
                          fontSize: 24,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Возврат',
                        style: FontStyles.mediumStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '0,00 UZS',
                        style: FontStyles.mediumStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Кошелек используется для оплаты всех платных услуг izle (реклама, размещение объявлений и покупка пакетов).',
              style: FontStyles.regularStyle(
                fontSize: 16,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(height: 60),
            Image.asset(
              'assets/images/izle.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),
            Spacer(),
            CutomeButton(
              title: 'Пополнить баланс',
              onpress: () => Get.to(() => FillUpWallet()),
              buttonColor: ColorPalate.mainColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
