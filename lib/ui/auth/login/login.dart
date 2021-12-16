import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/mask/mask_format.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/auth/login/widgets/recovery_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String errorMessage = '';
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final UserInfoController userInfoController = Get.find<UserInfoController>();

  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String passwordError = '';
  String phoneNumbeError = '';

  void checkingValidation() {
    if (password.text.length > 5 && phoneNumber.text.length > 15) {
      AllServices.login(phoneNumber.text.replaceAll(' ', ''), password.text);
    }

    if (password.text.length < 6 && password.text.length > 0) {
      setState(() {
        passwordError = 'Длина пароля должна быть больше 6';
      });
    }
    if (password.text.length == 0) {
      setState(() {
        passwordError = 'Пожалуйста, заполните поле пароля';
      });
    }
    if (phoneNumber.text.length > 0 && phoneNumber.text.length < 16) {
      setState(() {
        phoneNumbeError = 'Пожалуйста, проверьте свой номер телефона правильно';
      });
    }
    if (phoneNumber.text.length == 0) {
      setState(() {
        phoneNumbeError = 'Пожалуйста, заполните поле для номера телефона';
      });
    }
    if (phoneNumber.text.length == 16) {
      setState(() {
        phoneNumbeError = '';
      });
    }
    if (password.text.length > 5) {
      setState(() {
        passwordError = '';
      });
    }
  }

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
                    inputFormatters: [InputMask.maskPhoneNumber],
                    controller: phoneNumber,
                    onChanged: (vale) {
                      print(vale.length);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '998'),
                    validator: (value) {}),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                phoneNumbeError,
                style: TextStyle(fontSize: 11, color: Colors.red),
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
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                passwordError,
                style: TextStyle(fontSize: 11, color: Colors.red),
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
                // print(phoneNumber.text);
                // print(phoneNumber.text.length);

                // print(phoneNumber.text.replaceAll(' ', ''));
                print(phoneNumber.text.replaceAll(' ', ''));
                print(password.text);
                checkingValidation();
                print(passwordError);
                print(phoneNumbeError);
                // AllServices.login(
                //     phoneNumber.text.replaceAll(' ', ''), password.text);
                // userInfoController.fetchUserInfo(userToken: MyPref.token);
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
