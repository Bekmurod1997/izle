import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/components/custom_appbar.dart';

class WalletInstruction extends StatelessWidget {
  final int balance;
  WalletInstruction({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'wallet'),
      backgroundColor: Colors.white,
      // appBar: customAppBar1(context,
      //     title: '  Как пользоваться кошельком? ', eleveation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Divider(
              //   thickness: 3,
              // ),
              // Container(
              //   child: Row(
              //     children: [
              //       SizedBox(width: 10),
              //       Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: GestureDetector(
              //           onTap: () => Get.back(),
              //           child: RotatedBox(
              //             quarterTurns: 2,
              //             child: SvgPicture.asset(
              //               'assets/icons/next-icon.svg',
              //               height: 20,
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.05,
              //       ),
              //       Text(
              //         ' Как пользоваться кошельком?',
              //         style: FontStyles.boldStyle(
              //           fontSize: 24,
              //           fontFamily: 'Lato',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Divider(
              //   thickness: 3,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Image.asset(
                          'assets/images/wallet2.png',
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'yourWallet'.tr,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff100f36),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'walletIsUsed'.tr,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffB9C2C4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPalate.mainColor,
                      ),
                      child: Center(
                        child: Text(
                          'yourWallet'.tr + ': ' + '$balance UZS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
