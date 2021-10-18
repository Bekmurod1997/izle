import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/my_ads_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/models/all_message_model.dart';
import 'package:izle/models/login_model.dart';
import 'package:izle/models/product_detail_model.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/models/single_message_model.dart';
import 'package:izle/models/user_info_model.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/ui/profile/active_profile.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart' as g;

class AllServices {
  static PageNavigationController pageNavigationController =
      g.Get.find<PageNavigationController>();
  static final token = MyPref.token;
  static var client = http.Client();
  String pN = '9';

  static Future allMessages() async {
    print('url link');
    print(ApiUrl.allChat);
    try {
      var response = await client.get(Uri.parse(ApiUrl.allChat),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        var body = AllMessageModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in chat service');
      print(e);
    }
  }

  static Future singleMessage({int? messageId}) async {
    print('url link');
    print(ApiUrl.chatId + '$messageId');
    try {
      var response = await client.get(Uri.parse(ApiUrl.chatId + '$messageId'),
          headers: {
            'Accept': 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token'
          });
      print(response.body);
      if (response.statusCode == 200) {
        var body = SingleMessageModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in singleMessage');
      print(e);
    }
  }

  static Future sendMessage(
      {required String getterId, required String message}) async {
    print('url link');
    print(ApiUrl.sendMessage);
    try {
      var response = await client.post(Uri.parse(ApiUrl.sendMessage), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }, body: {
        'getter_id': getterId,
        'message': message,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('success in sending message');
        print(response.body);
        // return body;
      }
    } catch (e) {
      print('error in sending message');
      print(e);
    }
  }

  static Future listOfAllAds(int page) async {
    print('url link');
    print(ApiUrl.listOfAllAds + '$page');
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.listOfAllAds + '$page'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is list of all ads service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }

  static Future createAd() async {
    Dio dio = Dio();
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    try {
      // for(var i= 1; i<creatingAddInfoController.images.length; i++ ){

      //   }
      FormData formData = FormData.fromMap({
        'title': '${creatingAddInfoController.title}',
        'category_id': '${creatingAddInfoController.subCategoryId}',
        'price': '${creatingAddInfoController.price}',
        'price_d': '2799',
        'content': '${creatingAddInfoController.description}',
        'city_id': '10',
        'phone': '${userInfoController.fetchUserInfoList.first.phone}',
        'email': 'a@mail.ru',
        'type': '1',
        'address': '${creatingAddInfoController.locationInfo}',
        'responsible_person': 'Дмитрий Мухамадиев',
        'lat': '${creatingAddInfoController.lat}',
        'lng': '${creatingAddInfoController.long}',
      });
      String fileName = creatingAddInfoController.mainPhoto.value;
      List otherName = creatingAddInfoController.images;
      // for (var i = 1; i < creatingAddInfoController.images.length; i++) {
      //   otherName.add('gallery[$i]');
      // }
      formData.files.addAll([
        MapEntry(
          'photo',
          await MultipartFile.fromFile(fileName,
              filename: fileName.split('/').last),
        ),
      ]);
      // for (var i = 1; i < creatingAddInfoController.images.length; i++) {
      //   formData.files.addAll([
      //     MapEntry(
      //         'gallery[$i]',
      //         await MultipartFile.fromFile(otherName[i],
      //             filename: otherName[i].split('/').last)),
      //   ]);
      // }
      // formData.files.addAll()
      var response = await dio.post(
        ApiUrl.createAds,
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      // var response = await client.post(Uri.parse(ApiUrl.createAds), body: {
      //   'title': '${creatingAddInfoController.title}',
      //   'category_id': '${creatingAddInfoController.subCategoryId}',
      //   'price': '${creatingAddInfoController.price}',
      //   'price_d': '2799',
      //   'content': '${creatingAddInfoController.description}',
      //   'city_id': '10',
      //   'phone': '${userInfoController.fetchUserInfoList.first.phone}',
      //   'email': 'a@mail.ru',
      //   'type': '1',
      //   'address': '${creatingAddInfoController.locationInfo}',
      //   'responsible_person': 'Дмитрий Мухамадиев',
      //   'lat': '${creatingAddInfoController.lat}',
      //   'lng': '${creatingAddInfoController.long}',
      // }, headers: {
      //   "Authorization": "Bearer $token"
      // });

      if (response.statusCode == 200) {
        print('success in creating ads');
        creatingAddInfoController.allClear();
        // print(response.body);
        g.Get.to(() => ActiveProfileScreen());
      }
    } catch (e) {
      print('error in creating adds');
      print(e);
    }
  }

  static Future editAd(int id) async {
    final MyAdsController myAdsController = g.Get.find<MyAdsController>();

    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    print(ApiUrl.editAds + '$id');
    print('my title ${creatingAddInfoController.title}');
    print('my cat_id ${creatingAddInfoController.subCategoryId}');
    print('my price ${creatingAddInfoController.price}');
    print('my des ${creatingAddInfoController.description}');
    print('my type ${creatingAddInfoController.typeId}');
    print('my address ${creatingAddInfoController.locationInfo}');
    print(
        'my lat and long ${creatingAddInfoController.lat} and ${creatingAddInfoController.long}');
    try {
      var response =
          await client.post(Uri.parse(ApiUrl.editAds + '$id'), body: {
        'title': '${creatingAddInfoController.title}',
        'category_id': '${creatingAddInfoController.subCategoryId}',
        'price': '${creatingAddInfoController.price}',
        'price_d': '2799',
        'content': '${creatingAddInfoController.description}',
        'city_id': '10',
        'phone': '${userInfoController.fetchUserInfoList.first.phone}',
        'email': 'a@mail.ru',
        'type': '${creatingAddInfoController.typeId}',
        'address': '${creatingAddInfoController.locationInfo}',
        'responsible_person': 'Дмитрий Мухамадиев',
        'lat': '${creatingAddInfoController.lat}',
        'lng': '${creatingAddInfoController.long}',
      }, headers: {
        'Accept': 'application/json',
        // "Authorization": "Bearer $token",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('successs');
        print('success in creating ads');
        print(response.body);
        myAdsController.fetchMyOrders();
        creatingAddInfoController.allClear();
        g.Get.to(() => ActiveProfileScreen());
      }
    } catch (e) {
      print('error in creating adds');
      print(e);
    }
  }

  static Future myOrders() async {
    try {
      print('url link');
      print(ApiUrl.myAds);
      var response = await client.get(Uri.parse(ApiUrl.myAds),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is my orders');

        return body;
      }
    } catch (e) {
      print('error in myorders service');
    }
  }

  static Future authorOrders(String authorToken) async {
    try {
      print('url link');
      print(ApiUrl.myAds);
      var response = await client.get(Uri.parse(ApiUrl.myAds),
          headers: {"Authorization": "Bearer $authorToken"});
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        print('this is author orders');
        return body;
      }
    } catch (e) {
      print('error in myorders service');
    }
  }

  static Future editProfile(
      {required String name, required String email}) async {
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();

    try {
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }, body: {
        'email': email,
        'name': name,
      });
      if (response.statusCode == 200) {
        MyPref.userName = name;
        print('success in update profile');
        g.Get.snackbar(
          '',
          '',
          messageText: Text(
            'Ваши данные успешно сохранены',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorPalate.mainColor,
        );
        // userInfoController.fetchUserInfo();
      } else {
        print('eerrorr in else statement');
        g.Get.snackbar(
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

  static Future deleteAd(int id) async {
    try {
      print(ApiUrl.deleteAds + '$id');
      var response = await client.post(
        Uri.parse(ApiUrl.deleteAds + '$id'),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        print('ad was deleted successfully ');
      }
    } catch (e) {
      print('error in delete add service');
    }
  }

  static Future fetchFavorites() async {
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.favorites),
        headers: {"Authorization": "Bearer $token"},
      );
      print(response.statusCode);
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
      var response = await client.get(
        Uri.parse(ApiUrl.myProfile),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          "Authorization": "Bearer $token"
        },
      );
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

  static Future logout() async {
    try {
      var response = await client.get(Uri.parse(ApiUrl.logout),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        print('successfully logout');
        MyPref.clearToken();

        g.Get.offAll(() => NavScreen());
        pageNavigationController.pageControllerChanger(0);
        pageNavigationController.tabIndexChanger(0);
      }
    } catch (e) {
      print('error in logout service');
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

  static Future login(String phoneNumber, String password) async {
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    try {
      var response = await client.post(
        Uri.parse(ApiUrl.signin),
        body: {'phone': phoneNumber, 'password': password},
      );
      if (response.statusCode == 200) {
        var body = LoginModel.fromJson(json.decode(response.body));
        print('login successfully');
        print(response.body);
        MyPref.token = body.token!;
        print('token in login');
        print(MyPref.token);
        userInfoController.fetchUserInfo();
        g.Get.to(
          () => CreatingAddScreen(),
        );
      }
    } catch (e) {
      print('error in login service');
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

  static Future<ProductDetailModel?> productDetail(int prodId) async {
    try {
      var response =
          await client.get(Uri.parse(ApiUrl.productDetail + '$prodId'));
      if (response.statusCode == 200) {
        print('my url');
        print(ApiUrl.productDetail + '$prodId');
        print(response.body);
        print('this is product detail service');
        var body = ProductDetailModel.fromJson(json.decode(response.body));

        return body;
      }
    } catch (e) {
      print('error in product detail service');
      print(e);
    }
  }

  static Future recoveryPassword(String phoneNumber) async {
    try {
      var response = await client.post(Uri.parse(ApiUrl.recoverPassword),
          body: {'phone': phoneNumber});
      if (response.statusCode == 200) {
        print('success in sending phone to recovry');
      }
    } catch (e) {
      print('error in recovry passwrod sending phonenumber');
      print(e);
    }
  }

  static Future recoveryCodePassword(String phoneNumber, String code) async {
    try {
      var response = await client.post(Uri.parse(ApiUrl.recoverCode), body: {
        'phone': phoneNumber,
        'code': code,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('success in sending phone to code to recory');
      }
    } catch (e) {
      print('error in recovry passwrod sending code to recovery');
      print(e);
    }
  }
}
