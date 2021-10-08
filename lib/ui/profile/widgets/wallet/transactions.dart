import 'package:flutter/material.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/profile/widgets/wallet/fill_up_wallet.dart';
import 'package:izle/ui/profile/widgets/wallet/widget.dart/payment_info.dart';
import 'package:izle/ui/profile/widgets/wallet/widget.dart/payment_till.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'Ваш кошелек'),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CutomeButton(
                      title: 'Пополнить баланс',
                      buttonColor: ColorPalate.mainColor,
                      onpress: () => Get.to(() => FillUpWallet()),
                      textColor: Colors.white,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        PaymentInfo(),
                        PaymentTill(),
                        PaymentInfo(),
                        PaymentTill(),
                        PaymentInfo(),
                        PaymentTill(),
                        PaymentInfo(),
                        PaymentTill(),
                        PaymentInfo(),
                        PaymentTill(),
                        PaymentInfo(),
                        PaymentTill(),
                        SizedBox(height: 50),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          )),
      // floatingActionButton: CutomeButton(
      //   title: 'Пополнить баланс',
      //   onpress: () {},
      //   buttonColor: ColorPalate.mainColor,
      //   textColor: Colors.white,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
