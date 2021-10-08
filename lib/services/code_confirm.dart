import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/models/auth/code_confirm_model.dart';
import 'package:izle/utils/my_prefs.dart';

class CodeConfirm {
  static var client = http.Client();

  static Future codeConfirm({String? code, String? token}) async {
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
        MyPref.token = (body.data?.token) ?? '';
        print('MyPref toke');
        print(MyPref.token);
      }
    } catch (e) {
      print('error in auth');
    }
  }
}
