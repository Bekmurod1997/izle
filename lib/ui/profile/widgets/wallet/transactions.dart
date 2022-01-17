import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/transaction_click_controller.dart';
import 'package:izle/controller/transaction_payme_controlller.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/profile/widgets/wallet/fill_up_wallet.dart';
import 'package:izle/ui/profile/widgets/wallet/widget.dart/payment_info.dart';
import 'package:izle/ui/profile/widgets/wallet/widget.dart/payment_till.dart';
import 'package:get/get.dart';
import 'package:izle/models/all_transaction_model.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TransactionPaymeController transactionPaymeController =
      Get.put(TransactionPaymeController());
  final TransactionClickController transactionClickController =
      Get.put(TransactionClickController());

  @override
  void initState() {
    transactionPaymeController.fetchPaymeTransaction();
    transactionClickController.fetchClickTransaction();
    super.initState();
  }

  List<Data> myAllList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        appBar: customAppBar1(context, title: 'yourWallet'),
        body: Obx(() {
          if (transactionClickController.isLoading.value &&
              transactionPaymeController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            myAllList = transactionPaymeController.paymeTransactionList +
                transactionClickController.clickTransactionList;

            return Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: CutomeButton(
                          title: 'topUpBalance',
                          buttonColor: ColorPalate.mainColor,
                          onpress: () => Get.to(() => FillUpWallet()),
                          textColor: Colors.white,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: myAllList.length,
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: ColorPalate.lightGreen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'topUpBalance'.tr,
                                  style: FontStyles.boldStyle(
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  myAllList[index].amount.toString() +
                                      ' ' +
                                      'sum.t',
                                  style: FontStyles.boldStyle(
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        // ListView(
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   children: [
                        //     // PaymentInfo(),
                        //     // PaymentTill(),
                        //     // PaymentInfo(),
                        //     // PaymentTill(),
                        //     // PaymentInfo(),
                        //     // PaymentTill(),
                        //     // PaymentInfo(),
                        //     // PaymentTill(),
                        //     // PaymentInfo(),
                        //     // PaymentTill(),
                        //     // PaymentInfo(),
                        //     // PaymentTill(),

                        //     SizedBox(height: 50),
                        //     Text(myAllList.length.toString()),
                        //   ],
                        // ),

                        SizedBox(height: 40),
                      ],
                    ),
                  ],
                ));
          }
        }));
  }
}
