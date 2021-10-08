import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
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

  @override
  void initState() {
    print('aaaaa');
    print(MyPref.token);
    super.initState();
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
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
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
            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: Text(
            //     'Забыли пароль?',
            //     style: FontStyles.semiBoldStyle(
            //       fontSize: 16,
            //       fontFamily: 'Lato',
            //     ),
            //   ),
            // ),
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
                print('aaaa');
                SignUp.signUpUser(
                  phone: phoneController.text,
                  password: passwordController.text,
                );
                print(MyPref.token);
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
