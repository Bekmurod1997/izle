import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'Удалить профиль', eleveation: 0.5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(
              'Нам грустно с вами расставаться. Чтобы удалить профиль, перейдите по ссылке, которую мы отправим вам на электронную почту. Вы действительно хотите удалить профиль?',
              style: FontStyles.regularStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.black,
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: Image.asset('assets/images/izle.png'),
            ),
            Expanded(child: Container()),
            CutomeButton(
              title: 'Удалить аккаунт',
              onpress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Text(
                                    'Вы уверены, что хотите удалить аккаунт?',
                                    style: FontStyles.boldStyle(
                                        fontSize: 20, fontFamily: 'Lato'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await AllServices.deleteAccount();
                                      // await AllServices.deleteAd(
                                      //     widget.id);
                                      // Get.back();
                                      // myAdsActiveController
                                      //     .fetchMyActiveOrders();
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ColorPalate.mainColor,
                                          width: 5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ДА',
                                          style: FontStyles.boldStyle(
                                              fontSize: 25, fontFamily: 'Lato'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xffD7143A),
                                          width: 5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'НЕТ',
                                          style: FontStyles.boldStyle(
                                              fontSize: 25, fontFamily: 'Lato'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              buttonColor: ColorPalate.mainColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
