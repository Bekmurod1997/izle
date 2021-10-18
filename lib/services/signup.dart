import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/models/auth/signup_model.dart';
import 'package:izle/services/code_confirm.dart';
import 'package:izle/ui/nav.dart';
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
    UserInfoController userInfoController = Get.find<UserInfoController>();

    try {
      var response = await client.post(Uri.parse(ApiUrl.signup), body: {
        'name': 'user',
        // 'email': 'a@mail.ru',
        'phone': phone,
        'password': password,
      });
      if (response.statusCode == 200) {
        MyPref.userName = 'user';
        var body = SignUpModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is signup service');
        print('token:');
        print(body.data!.token);

        print('code');
        print(body.data!.code);
        await CodeConfirm.codeConfirm(
            code: body.data!.code, token: body.data!.token);
        print('password');
        print(password);

        MyPref.code = body.data!.code!;
        await Get.offAll(() => NavScreen());
        userInfoController.fetchUserInfo();
        // pageNavigationController.pageControllerChanger(0);
      }
    } catch (e) {
      print('error in sign up');
    }
  }
}
