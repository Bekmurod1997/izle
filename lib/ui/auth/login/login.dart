import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/auth/login/widgets/recovery_password.dart';
import 'package:izle/utils/my_prefs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final UserInfoController userInfoController = Get.find<UserInfoController>();

  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Text(
                'Телефон*',
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
                  keyboardType: TextInputType.phone,
                  controller: phoneNumber,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '998'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Ваш пароль*',
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Color(0xff80858C),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 11, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextField(
                  controller: password,
                  style: TextStyle(fontSize: 16.0),
                  obscureText: _obscureText,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: _toggle,
                        child: Text(
                          _obscureText ? 'показать ' : 'скрыть',
                          style: TextStyle(
                            color: Color(0xff635757),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => RecovryPasswordScreen()),
              child: Container(
                padding: const EdgeInsets.only(top: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Забыли пароль?',
                  style: FontStyles.semiBoldStyle(
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                var phone = phoneNumber.text;
                // Get.dialog(
                //   Scaffold(
                //     backgroundColor: Colors.black.withOpacity(.1),
                //     body: Center(
                //       child: Container(
                //         margin: const EdgeInsets.symmetric(horizontal: 20.0),
                //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //         color: Colors.white,
                //         width: double.infinity,
                //         height: 100.0,
                //         child: Row(
                //           children: [
                //             CircularProgressIndicator(
                //               valueColor: AlwaysStoppedAnimation<Color>(
                //                   ColorPalate.mainColor),
                //             ),
                //             SizedBox(
                //               width: 30,
                //             ),
                //             Text('Подождите пожалуйста'),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // );

                AllServices.login(phoneNumber.text, password.text);
                userInfoController.fetchUserInfo(userToken: MyPref.token);
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
                    'Войти',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text('При входе вы соглашаетесь с нашими'),
                  Text(
                    'Условиями использования.',
                    style:
                        FontStyles.boldStyle(fontSize: 12, fontFamily: 'Lato'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
