import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/auth/login/login.dart';
import 'package:izle/ui/auth/signup/signup.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/nav.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  late int activeScreen;
  @override
  void initState() {
    activeScreen = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F5),
      // appBar: customAppBar1(context, title: '  Добро пожаловать на izle   '),
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
                    pageNavigationController.pageControllerChanger(0);
                    pageNavigationController.tabIndexChanger(0);
                    Get.to(() => NavScreen());
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
                  'welcomeToIzle'.tr,
                  style: FontStyles.boldStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        activeScreen = 0;
                      });
                    },
                    child: Text(
                      'enter'.tr,
                      style: activeScreen == 0
                          ? FontStyles.boldStyle(
                              fontSize: 18, fontFamily: 'Lato', undeline: true)
                          : FontStyles.regularStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              undeline: false,
                              color: Color(0xff827878),
                            ),
                    ),
                    style: TextButton.styleFrom(
                      primary:
                          activeScreen == 0 ? Colors.black : Color(0xff827878),
                    ),
                  ),
                  SizedBox(width: 40),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        activeScreen = 1;
                      });
                    },
                    child: Text(
                      'singUp'.tr,
                      style: activeScreen == 1
                          ? FontStyles.boldStyle(
                              fontSize: 18, fontFamily: 'Lato', undeline: true)
                          : FontStyles.regularStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              undeline: false,
                              color: Color(0xff827878),
                            ),
                    ),
                    style: TextButton.styleFrom(
                      primary:
                          activeScreen == 1 ? Colors.black : Color(0xff827878),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: activeScreen == 0 ? LoginScreen() : SignUpScreen())
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
