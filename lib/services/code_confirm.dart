import 'dart:io';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/models/auth/code_confirm_model.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/utils/my_prefs.dart';

class CodeConfirm {
  static var client = http.Client();

  static Future codeConfirm({String? code, String? token}) async {
    final UserInfoController userInfoController =
        Get.find<UserInfoController>();

    try {
      var response = await client.post(Uri.parse(ApiUrl.confirmCod), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }, body: {
        'code': code,
      });
      if (response.statusCode == 200) {
        var body = CodeConfirModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is codeconfirm service');
        print('token:');
        print(body.data!.token);
        print(body.data!.phone);
        print(body.data!.name);
        print(body.data!.email);
        MyPref.token = body.data!.token!;
        MyPref.phoneNumber = body.data!.phone!;
        MyPref.userName = '${body.data!.phone!}';
        print('-----');
        print(MyPref.token);
        print(MyPref.phoneNumber);
        print(MyPref.userName);
        print('MyPref toke');
        print(MyPref.token);
        await Get.offAll(() => NavScreen());
        userInfoController.fetchUserInfo(userToken: MyPref.token);
      }
    } catch (e) {
      print('error in code confirm');
    }
  }
}
