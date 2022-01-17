// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/language_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/components/custom_listTile.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();

  final LanguageController languageController = Get.find<LanguageController>();

  _launchURLApp() async {
    String url = 'https://izle.uz/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          child: Marquee(
            text: 'welcomeToIzle'.tr,
            style: FontStyles.regularStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    height: 80,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        'pleaseAuthToCreateAds'.tr,
                        style: FontStyles.regularStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => pageNavigationController.pageControllerChanger(2),

                // onTap: () => Get.to(() => CreatingAddScreen()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(top: 31),
                  decoration: BoxDecoration(
                    color: ColorPalate.mainColor,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'enter'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'profileAndSetting'.tr,
                style: FontStyles.boldStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 30),
              CustomListTile(
                title: 'settings',
                onpress: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                Image.asset(
                                  'assets/images/izle.png',
                                  width: 130,
                                  height: 100,
                                ),
                                Text('toUseThisFunction'.tr),
                              ]),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.cancel_sharp,
                                    color: ColorPalate.mainColor,
                                  ),
                                ),
                              )
                            ],
                          ),

                          // content: Text('This is my content'),
                        )),
              ),
              // CustomListTile(
              //   title: 'Выбрать',
              //   onpress: () =>
              // ),
              CustomListTile(
                title: 'conditionUsage',
                onpress: _launchURLApp,
              ),
              CustomListTile(
                title: 'policeConfindential',
                onpress: _launchURLApp,
              ),
              CustomListTile(
                title: 'aboutApp',
                onpress: _launchURLApp,
              ),

              CustomListTile(
                title: 'language',
                onpress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, StateSetter setState) {
                      return AlertDialog(
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                val = 1;
                                languageController.changeLanguage('kr', 'KR');
                                MyPref.lang = 'kr';

                                Get.back();
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Qaraqalpaq tili '),
                                Radio(
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (int? value) {
                                    setState(() {
                                      val = value!;
                                      languageController.changeLanguage(
                                          'kr', 'KR');
                                      MyPref.lang = 'kr';

                                      Get.back();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                val = 2;
                                languageController.changeLanguage('ru', 'RU');
                                MyPref.lang = 'ru';
                                Get.back();
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('русский язык'),
                                Radio(
                                  value: 2,
                                  groupValue: val,
                                  onChanged: (int? value) {
                                    setState(() {
                                      val = value!;
                                      languageController.changeLanguage(
                                          'ru', 'RU');
                                      MyPref.lang = 'ru';
                                      Get.back();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                val = 3;
                                languageController.changeLanguage('uz', 'UZ');
                                MyPref.lang = 'uz';
                                Get.back();
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('O\'zbek tili'),
                                Radio(
                                  value: 3,
                                  groupValue: val,
                                  onChanged: (int? value) {
                                    setState(() {
                                      val = value!;
                                      languageController.changeLanguage(
                                          'uz', 'UZ');
                                      MyPref.lang = 'uz';
                                      Get.back();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ]),

                        // content: Text('This is my content'),
                      );
                    });
                  },
                ),
              ),
              // Container(
              //     height: 40,
              //     // width: 100,
              //     child: Row(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             languageController.changeLanguage('kr', 'KR');
              //             MyPref.lang = 'kr';
              //           },
              //           child: SizedBox(
              //             height: 50,
              //             width: 60,
              //             child: Image.asset(
              //               'assets/images/kara.png',
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //         SizedBox(width: 20),
              //         GestureDetector(
              //           onTap: () {
              //             languageController.changeLanguage('uz', 'UZ');
              //             MyPref.lang = 'uz';
              //           },
              //           child: SizedBox(
              //             height: 50,
              //             width: 60,
              //             child: Image.asset(
              //               'assets/images/uz.png',
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //         SizedBox(width: 20),
              //         GestureDetector(
              //           onTap: () {
              //             languageController.changeLanguage('ru', 'RU');
              //             MyPref.lang = 'ru';
              //           },
              //           child: SizedBox(
              //             height: 50,
              //             width: 60,
              //             child: Image.asset(
              //               'assets/images/ru1.png',
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //       ],
              //     )),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
