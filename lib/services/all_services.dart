import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/models/pdetail.dart';
import 'package:izle/models/user_info_model.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart';

class AllServices {
  static final token = MyPref.token;
  static var client = http.Client();

  static Future listOfAllAds(int page) async {
    print('url link');
    print(ApiUrl.listOfAllAds + '$page');
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.listOfAllAds + '$page'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is list of all ads service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }

  static Future editProfile(
      {required String name, required String email}) async {
    final UserInfoController userInfoController =
        Get.find<UserInfoController>();

    try {
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }, body: {
        'email': email,
        'name': name,
      });
      if (response.statusCode == 200) {
        print('success in update profile');
        Get.snackbar(
          '',
          '',
          messageText: Text(
            'Ваши данные успешно сохранены',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorPalate.mainColor,
        );
        userInfoController.fetchUserInfo();
      } else {
        print('eerrorr in else statement');
        Get.snackbar(
          '',
          '',
          messageText: Text(
            'Что-то пошло не так, попробуйте позже',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorPalate.mainColor,
        );
      }
    } catch (e) {
      print('error in editProfile service');
    }
  }

  static Future search(String search, int page) async {
    print('url link');
    print(ApiUrl.search + '$search' + '&page=' + '$page');
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.search + '$search' + '&page=' + '$page'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is list of all search ads service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }

  static Future fetchFavorites() async {
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.favorites),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is favorite service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }

  static Future addAndRemoveFav(int id) async {
    try {
      var response = await client.get(
          Uri.parse(ApiUrl.addAndDeleteFavorite + '$id'),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        // print('success in adding favorites');
        // print(response.body);
      } else {
        print('error in else statement');
        print(token);
        print(response.statusCode);
        print(ApiUrl.addAndDeleteFavorite + '$id');
      }
    } catch (e) {
      print('error in favorite service');
    }
  }

  static Future userInfo() async {
    try {
      var response = await client.get(Uri.parse(ApiUrl.myProfile),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        // print(response.body);
        // print('this is userInfo service');
        var body = UserInfoModel.fromJson(json.decode(response.body));
        return body;
      }
    } catch (e) {
      print('error in edit profile service');
    }
  }

  static Future allCities() async {
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.allCities),
      );
      if (response.statusCode == 200) {
        // print(response.body);
        // print('this is userInfo service');
        var body = CityModel.fromJson(json.decode(response.body));
        return body;
      }
    } catch (e) {
      print('error in allcities service');
    }
  }

  static Future editProfileService() async {
    try {
      var response = await client.post(Uri.parse(ApiUrl.updateProfile),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        // print(response.body);
        // print('this is editProfile service');
      }
    } catch (e) {
      print('error in edit profile service');
    }
  }

  static Future<ExampleProductDetail?> productDetail(int prodId) async {
    try {
      var response =
          await client.get(Uri.parse(ApiUrl.productDetail + '$prodId'));
      if (response.statusCode == 200) {
        print('my url');
        print(ApiUrl.productDetail + '$prodId');
        print(response.body);
        print('this is product detail service');
        var body = ExampleProductDetail.fromJson(json.decode(response.body));

        return body;
      }
    } catch (e) {
      print('error in product detail service');
      print(e);
    }
  }
}
