import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:izle/controller/list_of_prices_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/home/home_screen.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FillUpWallet extends StatefulWidget {
  const FillUpWallet({Key? key}) : super(key: key);

  @override
  _FillUpWalletState createState() => _FillUpWalletState();
}

class _FillUpWalletState extends State<FillUpWallet> {
  final ListOfPriceController listOfPriceController =
      Get.put(ListOfPriceController());

  int selectedButton = -1;
  int priceAmount = 0;
  int paymentType = 0;
  int paymentId = 0;
  bool toPay = false;
  var priceList = [
    '5 000 ' + 'sum'.tr,
    '10 000 ' + 'sum'.tr,
    '20 000 ' + 'sum'.tr,
    '30 000 ' + 'sum'.tr,
    '50 000 ' + 'sum'.tr,
    '60 000 ' + 'sum'.tr,
    '80 000 ' + 'sum'.tr,
    '100 000 ' + 'sum'.tr,
    '120 000 ' + 'sum'.tr,
    '200 000 ' + 'sum'.tr,
    '500 000 ' + 'sum'.tr,
    '100 000 ' + 'sum'.tr,
  ];
  @override
  void initState() {
    listOfPriceController.fetchPrices();
    print(listOfPriceController.listOfPrice);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    super.initState();
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  void paymentMethod() async {
    await AllServices.pay(
        id: paymentId, type: paymentType == 1 ? 'payme' : 'click');
    // Get.to(() => PaymentLinkScreen());
    // ignore: unused_element
    _launchURLBrowser() async {
      const url = 'https://flutterdevs.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    String url = '${MyPref.paymentLink}';
    print('the url');
    print(url);
    _launchUniversalLinkIos(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        appBar: customAppBar1(context, title: '  ' + 'topUpBalance'.tr + '  '),
        body: Obx(() {
          if (listOfPriceController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            print(listOfPriceController.listOfPrice.length.toString());
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'chooseSum'.tr,
                      style: FontStyles.semiBoldStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                      ),
                    ),
                    Text(
                      'priceIsWithTaxs'.tr,
                      style: FontStyles.regularStyle(
                        fontSize: 12,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 5),
                    GridView.builder(
                      reverse: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfPriceController.listOfPrice.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 15,
                        // height: MediaQuery.of(context).size.height * 0.4,
                        height: MediaQuery.of(context).size.height * 0.055,
                      ),
                      itemBuilder: (context, index) {
                        String price =
                            '${listOfPriceController.listOfPrice[index].amount}';

                        if (price.length == 5) {
                          price = price.substring(0, 2) +
                              " " +
                              price.substring(2, 5);
                          print(price);
                        } else if (price.length == 6) {
                          price = price.substring(0, 3) +
                              " " +
                              price.substring(3, 6);
                          print(price);
                        } else if (price.length == 7) {
                          price = price.substring(0, 1) +
                              " " +
                              price.substring(1, 4) +
                              " " +
                              price.substring(4, 7);
                          print(price);
                        }
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = index;
                                toPay = true;
                                priceAmount = listOfPriceController
                                    .listOfPrice[index].amount!;
                                paymentId = listOfPriceController
                                    .listOfPrice[index].id!;
                              });
                            },
                            child: Text(
                              '$price ' + 'sum'.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: selectedButton == index
                                  ? Colors.white
                                  : Color(0xff7C7E7E),
                              backgroundColor: selectedButton == index
                                  ? ColorPalate.mainColor
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'paymentChoice'.tr,
                      style: FontStyles.boldStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          paymentType = 1;
                        });

                        toPay
                            ? paymentMethod()
                            : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("pleaseChoosePrice".tr)));
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: paymentType == 1
                              ? ColorPalate.lightGreen
                              : Colors.white,
                        ),
                        child: Center(
                          child: Image.asset('assets/images/payme.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          paymentType = 2;
                        });
                        toPay
                            ? paymentMethod()
                            : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("pleaseChoosePrice".tr)));
                        // toPay ?
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: paymentType == 2
                              ? ColorPalate.lightGreen
                              : Colors.white,
                        ),
                        child: Center(
                          child: Image.asset('assets/images/click.png'),
                        ),
                      ),
                    ),
                    // SizedBox(height: 90),
                    // toPay
                    //     ? CutomeButton(
                    //         title: '???????????????? ' + '${priceAmount}',
                    //         onpress: () async {
                    //           if (paymentType != 0) {
                    //             await AllServices.pay(
                    //                 id: paymentId,
                    //                 type: paymentType == 1 ? 'payme' : 'click');
                    //             // Get.to(() => PaymentLinkScreen());
                    //             // ignore: unused_element
                    //             _launchURLBrowser() async {
                    //               const url = 'https://flutterdevs.com/';
                    //               if (await canLaunch(url)) {
                    //                 await launch(url);
                    //               } else {
                    //                 throw 'Could not launch $url';
                    //               }
                    //             }

                    //             String url = '${MyPref.paymentLink}';
                    //             print('the url');
                    //             print(url);
                    //             _launchUniversalLinkIos(url);
                    //             // _launchInWebViewWithJavaScript(url);
                    //             // _launchURLApp();
                    //           } else {
                    //             return showDialog(
                    //                 context: context,
                    //                 builder: (_) => AlertDialog(
                    //                       title: Text(
                    //                         '????????????????????, ???????????????? ???????????? ????????????',
                    //                         style: TextStyle(fontSize: 16),
                    //                       ),

                    //                       // content: Text('This is my content'),
                    //                     ));
                    //           }
                    //         },
                    //         buttonColor: ColorPalate.mainColor,
                    //         textColor: Colors.white,
                    //       )
                    //     : Container(),
                    // SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
