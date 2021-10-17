import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/page_navgation_controller.dart';
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
        CodeConfirm.codeConfirm(code: body.data!.code, token: body.data!.token);
        print('password');
        print(password);
        // var confirmResponse =
        //     await client.post(Uri.parse(ApiUrl.confirmCod), headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer ${body.data!.token}'
        // }, body: {
        //   'code': body.data!.code,
        // });
        // if (confirmResponse.statusCode == 200) {
        //   var bodyConfirm =
        //       CodeConfirModel.fromJson(json.decode(response.body));
        //   print(response.body);
        //   print('this is codeconfirm service');
        //   print('token:');
        //   print(bodyConfirm.data!.token);
        //   print(bodyConfirm.data!.phone);
        //   print(bodyConfirm.data!.name);
        //   MyPref.token = bodyConfirm.data!.token!;
        // } else {
        //   print('error in signup conform servic');
        // }
        // await CodeConfirm.codeConfirm(
        //   code: body.data!.code,
        //   token: token,
        // );
        // var response2 = await client.post(
        //   Uri.parse(ApiUrl.confirmCod),
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        //   body: {
        //     'code': body.data!.code,
        //   },
        // );

        MyPref.code = body.data!.code!;
        Get.offAll(() => NavScreen());
        // pageNavigationController.pageControllerChanger(0);
      }
    } catch (e) {
      print('error in auth');
    }
  }
}
