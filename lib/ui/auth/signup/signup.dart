import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/mask/mask_format.dart';
import 'package:izle/services/signup.dart';
import 'package:izle/utils/my_prefs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String passwordError = '';
  String phoneNumbeError = '';

  @override
  void initState() {
    print('aaaaa');
    print(MyPref.token);
    super.initState();
  }

  void checkingValidation() {
    if (passwordController.text.length > 5 &&
        phoneController.text.length > 15) {
      SignUp.signUpUser(
        phone: phoneController.text.replaceAll(' ', ''),
        password: passwordController.text,
      );
      // AllServices.login(phoneNumber.text.replaceAll(' ', ''), password.text);
    }

    if (passwordController.text.length < 6 &&
        passwordController.text.length > 0) {
      setState(() {
        passwordError = 'Длина пароля должна быть больше 6';
      });
    }
    if (passwordController.text.length == 0) {
      setState(() {
        passwordError = 'Пожалуйста, заполните поле пароля';
      });
    }
    if (phoneController.text.length > 0 && phoneController.text.length < 16) {
      setState(() {
        phoneNumbeError = 'Введён неверный номер телефона';
      });
    }
    if (phoneController.text.length == 0) {
      setState(() {
        phoneNumbeError = 'Пожалуйста, заполните поле для номера телефона';
      });
    }
    if (phoneController.text.length == 16) {
      setState(() {
        phoneNumbeError = '';
      });
    }
    if (passwordController.text.length > 5) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Телефон или электронная почта*',
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
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
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  inputFormatters: [InputMask.maskPhoneNumber],
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: '998',
                    border: InputBorder.none,
                  ),
                ),
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
              padding: const EdgeInsets.only(top: 15),
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Ваш пароль*',
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
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
                  controller: passwordController,
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
            SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Этот сайт защищен reCATCHA и Политикой конфиденциальности и Условиями использования Google.',
                style: FontStyles.regularStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Я соглашаюсь с правилами использования сервиса, а также с передачей и обработкой моих данных в izle. Я подтверждаю свое совершеннолетие и ответственность за размещение объявления.',
                style: FontStyles.regularStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                MyPref.phoneNumber = phoneController.text;
                print(MyPref.phoneNumber);
                print(phoneController.text.replaceAll(' ', ''));
                checkingValidation();
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
                //             Text(
                //               'pleaseWait'.tr,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // );

                // SignUp.signUpUser(
                //   phone: phoneController.text.replaceAll(' ', ''),
                //   password: passwordController.text,
                // );
                // print(MyPref.token);
              },
              // onTap: () => Get.to(
              //   () => CreatingAddScreen(),
              // ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(top: 31, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: ColorPalate.mainColor,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
