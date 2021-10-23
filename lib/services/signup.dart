import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/models/auth/signup_model.dart';
import 'package:izle/ui/auth/signup/widgets/confirm_screen.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignUp {
  static var client = http.Client();
  PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  static Future signUpUser({
    String? phone,
    String? password,
    String? name,
    String? email,
  }) async {
    // UserInfoController userInfoController = Get.find<UserInfoController>();

    try {
      var response = await client.post(Uri.parse(ApiUrl.signup), headers: {
        'Accept': 'application/json',
      }, body: {
        'name': phone,
        // 'email': 'a@mail.ru',
        'phone': phone,
        'password': password,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = SignUpModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is signup service');
        print('token:');
        print(body.data!.token);

        print('code');
        print(body.data!.code);
        MyPref.code = body.data!.code!;
        MyPref.token = body.data!.token!;
        // MyPref.userName = body.data!.ph;
        await Get.to(() => ConfirmScreen());
        // await CodeConfirm.codeConfirm(
        //     code: body.data!.code, token: body.data!.token);
        print('password');
        print(password);

        // await Get.offAll(() => NavScreen());
        // userInfoController.fetchUserInfo();
        // pageNavigationController.pageControllerChanger(0);
      } else if (response.statusCode == 422) {
        return Get.dialog(
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Scaffold(
              backgroundColor: Colors.black.withOpacity(.1),
              body: GestureDetector(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    color: Colors.white,
                    width: double.infinity,
                    height: 100.0,
                    child: Center(
                      child: Text(
                        'Аккаунт с таким номером уже существует',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    } catch (e) {
      print('error in sign up');
    }
  }
}
