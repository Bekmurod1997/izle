import 'dart:async';

import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/services/code_confirm.dart';
import 'package:izle/utils/my_prefs.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  void validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      if (codeController.text == MyPref.code) {
        CodeConfirm.codeConfirm(code: codeController.text, token: MyPref.token);
        // ConfirmCode.codeConfirmFunction(code: codeController.text);
        // Get.offAll(HomeScreen());

        // Get.offAll(HomeScreen());
      } else {
        print('hatolik');
      }
    }
  }

  late Timer _timer;
  int _start = 30;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(
              child: Image.asset('assets/images/izle.png'),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Введите полученный код',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        errorMessage = 'Поле не может быть пустым';
                      });
                      return '';
                    } else if (value.length < 6) {
                      setState(() {
                        errorMessage = 'Поле не может быть меньше 6 числа';
                      });
                      return '';
                    } else if (value != MyPref.code) {
                      setState(() {
                        errorMessage = 'Пожалуйста, введите правильный код';
                      });
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // Text('sssss'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  Text(
                    errorMessage,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  errorMessage.isEmpty
                      ? Container(
                          color: Colors.red,
                        )
                      : SizedBox(
                          height: 10,
                        ),
                  Center(
                      child: _start == 0
                          ? GestureDetector(
                              onTap: () {
                                if (_start == 0) {
                                  setState(() {
                                    _start = 30;
                                  });
                                  startTimer();
                                  // SignIn.signInUser(
                                  //     userNumber: MyPref.phoneNumber,
                                  //     fcmToken: MyPref.fToken);
                                } else {
                                  // _showSnackBar(context);
                                  validateAndSave();
                                }
                              },
                              child: Text('Отправить код еще раз'))
                          : RichText(
                              text: TextSpan(
                                text: 'Новый код через',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '$_start',
                                      style: TextStyle(
                                          color: ColorPalate.mainColor)),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'секунды',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 54,
                    width: 500,
                    child: RaisedButton(
                      elevation: 0,
                      color: ColorPalate.mainColor,
                      onPressed: () => validateAndSave(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Авторизоваться',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  // Text('newCode'.tr + '$_start' + 'sekund'.tr)),
                ],
              ),
              // child:
            ),
          ],
        ),
      ),
    );
  }
}
