import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/auth/login/login.dart';
import 'package:izle/ui/auth/signup/signup.dart';

class UnAuthMessageScreen extends StatefulWidget {
  @override
  _UnAuthMessageScreenState createState() => _UnAuthMessageScreenState();
}

class _UnAuthMessageScreenState extends State<UnAuthMessageScreen> {
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
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Сообщение',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
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
                        'Войти',
                        style: activeScreen == 0
                            ? FontStyles.boldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                                undeline: true)
                            : FontStyles.regularStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                                undeline: false,
                                color: Color(0xff827878),
                              ),
                      ),
                      style: TextButton.styleFrom(
                        primary: activeScreen == 0
                            ? Colors.black
                            : Color(0xff827878),
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
                        'Зарегистрироваться',
                        style: activeScreen == 1
                            ? FontStyles.boldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                                undeline: true)
                            : FontStyles.regularStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                                undeline: false,
                                color: Color(0xff827878),
                              ),
                      ),
                      style: TextButton.styleFrom(
                        primary: activeScreen == 1
                            ? Colors.black
                            : Color(0xff827878),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: activeScreen == 0 ? LoginScreen() : SignUpScreen())
            ],
          ),
        ));
  }
}
