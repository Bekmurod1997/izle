// ignore_for_file: unused_local_variable

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
import 'package:izle/models/ads_view_model.dart';
import 'package:izle/models/all_message_model.dart';
import 'package:izle/models/list_of_price_model.dart';
import 'package:izle/models/login_model.dart';
import 'package:izle/models/pay_model.dart';
import 'package:izle/models/product_detail_model.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/models/re_password_model.dart';
import 'package:izle/models/recovery_password_model.dart';
import 'package:izle/models/single_message_model.dart';
import 'package:izle/models/user_info_model.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart' as g;
import 'package:izle/models/all_regions_model.dart';

class AllServices {
  static PageNavigationController pageNavigationController =
      g.Get.find<PageNavigationController>();

  static var client = http.Client();
  String pN = '9';

  static Future allMessages() async {
    print('url link');
    print(ApiUrl.allChat);
    try {
      var response = await client.get(Uri.parse(ApiUrl.allChat),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
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

  static Future allRegions() async {
    print('url link');
    print(ApiUrl.allCities);
    try {
      var response = await client.get(Uri.parse(ApiUrl.allCities));
      if (response.statusCode == 200) {
        var body = AllRegionsModel.fromJson(json.decode(response.body));
        // print(response.body);
        return body;
      }
    } catch (e) {
      print('error in allRegions services');
      print(e);
    }
  }

  static Future singleMessage({int? messageId}) async {
    print('url link');
    print(ApiUrl.chatId + '$messageId');
    try {
      var response =
          await client.get(Uri.parse(ApiUrl.chatId + '$messageId'), headers: {
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
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
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();

    print('url link');
    print(ApiUrl.sendMessage);
    try {
      var response = await client.post(Uri.parse(ApiUrl.sendMessage), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      }, body: {
        'getter_id': getterId,
        'message': message,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = SingleMessageModel.fromJson(json.decode(response.body));
        print('success in sending message');
        print(response.body);

        return body;
      }
    } catch (e) {
      print('error in sending message');
      print(e);
    }
  }

  static Future fetchAds({int? page}) async {
    print('aaa');
    print('http://izle.uz/api/ads/index?' + 'page=${page ?? ""}');
    try {
      var response = await client.get(
          Uri.parse('http://izle.uz/api/ads/index?' + 'page=${page ?? ""}'),
          headers: {
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is list of all ads service');
        return body;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<AdvertisementListModel?> listOfAllAds(int page) async {
    print('url link');
    print(ApiUrl.listOfAllAds + '$page');
    try {
      var response = await client.get(
          Uri.parse(
            ApiUrl.listOfAllAds + '$page',
          ),
          headers: {
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is list of all ads service');
        return body;
      }
      return null;
    } catch (e) {
      print('error in auth');
    }
  }

  static Future createAd() async {
    g.Get.dialog(
      Scaffold(
        backgroundColor: Colors.black.withOpacity(.1),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.white,
            width: double.infinity,
            height: 100.0,
            child: Row(
              children: [
                CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
                ),
                SizedBox(
                  width: 30,
                ),
                Text('Подождите пожалуйста'),
              ],
            ),
          ),
        ),
      ),
    );

    print('createing add url');
    print(
      ApiUrl.createAds,
    );
    Dio dio = Dio();
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    // try {
    // for(var i= 1; i<creatingAddInfoController.images.length; i++ ){

    //   }
    FormData formData = FormData.fromMap({
      'title': '${creatingAddInfoController.title}',
      'category_id': '${creatingAddInfoController.subCategoryId}',
      'price': '${creatingAddInfoController.price}',
      'price_d': '2799',
      'content': '${creatingAddInfoController.description}',
      'city_id': '10',
      'phone': '${MyPref.phoneNumber}',
      'email': 'a@mail.ru',
      'type': '1',
      'address': '${creatingAddInfoController.locationInfo}',
      'responsible_person': 'Дмитрий Мухамадиев',
      // 'lat': '41.26465',
      // 'lng': '69.21627',
      'lat': '${creatingAddInfoController.lat}',
      'lng': '${creatingAddInfoController.long}',
      'name': '${MyPref.userName}'
    });
    // String fileName = creatingAddInfoController.mainPhoto.value;
    // List otherName = creatingAddInfoController.images;
    // for (var i = 1; i < creatingAddInfoController.images.length; i++) {
    //   otherName.add('gallery[$i]');
    // }
    List photos = creatingAddInfoController.images;
    print('ssdid');
    print(photos);
    for (var i = 0; i < photos.length; i++) {
      var fileName = photos[i];
      if (i == 0) {
        formData.files.addAll([
          MapEntry(
            'photo',
            await MultipartFile.fromFile(fileName,
                filename: fileName.split('/').last),
          ),
        ]);
      } else {
        formData.files.addAll([
          MapEntry(
              'gallery[${i - 1}]',
              await MultipartFile.fromFile(fileName,
                  filename: fileName.split('/').last)),
        ]);
      }
    }

    // formData.files.addAll([
    //   MapEntry(
    //     'photo',
    //     await MultipartFile.fromFile(fileName,
    //         filename: fileName.split('/').last),
    //   ),
    // ]);
    // // for (var i = 1; i < creatingAddInfoController.images.length; i++) {
    // formData.files.addAll([
    //   MapEntry(
    //       'gallery[$i]',
    //       await MultipartFile.fromFile(otherName[i],
    //           filename: otherName[i].split('/').last)),
    // ]);
    // // }
    // // formData.files.addAll()
    try {
      var response = await dio.post(
        ApiUrl.createAds,
        data: formData,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
          "Authorization": "Bearer ${MyPref.token}"
        }),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('success in creating ads');
        creatingAddInfoController.allClear();
        // print(response.body);
        // g.Get.to(() => ActiveProfileScreen());
        pageNavigationController.pageControllerChanger(4);
        pageNavigationController.tabIndexChanger(4);
        g.Get.offAll(
          () => NavScreen(),
        );
      }
    } catch (e) {
      print('error in creating adds');
      print(e);
    }

    // var response = await client.post(Uri.parse(ApiUrl.createAds), body: {
    //   'title': '${creatingAddInfoController.title}',
    //   'category_id': '${creatingAddInfoController.subCategoryId}',
    //   'price': '${creatingAddInfoController.price}',
    //   'price_d': '2799',
    //   'content': '${creatingAddInfoController.description}',
    //   'city_id': '10',
    //   'phone': '${MyPref.phoneNumber}',
    //   'email': 'a@mail.ru',
    //   'type': '1',
    //   'address': '${creatingAddInfoController.locationInfo}',
    //   'responsible_person': 'Дмитрий Мухамадиев',
    //   'lat': '${creatingAddInfoController.lat}',
    //   'lng': '${creatingAddInfoController.long}',
    //   'name': '${MyPref.userName}'
    // }, headers: {
    //   "Authorization": "Bearer ${MyPref.token}"
    // });

    // }
    // catch (e) {
    // print('error in creating adds');
    // print(e);
    // }
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
        // "Authorization": "Bearer ${MyPref.token}",
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('successs');
        print('success in creating ads');
        print(response.body);
        myAdsController.fetchMyOrders();
        creatingAddInfoController.allClear();
        // g.Get.to(() => ActiveProfileScreen());
        pageNavigationController.pageControllerChanger(4);
        pageNavigationController.tabIndexChanger(4);

        g.Get.offAll(
          () => NavScreen(),
        );
      }
    } catch (e) {
      print('error in creating adds');
      print(e);
    }
  }

  static Future adView() async {
    try {
      print(ApiUrl.adsView);
      var response = await client.get(Uri.parse(ApiUrl.adsView));
      if (response.statusCode == 200) {
        var body = AdsViewModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in adsview service');
    }
  }

  static Future myOrders() async {
    try {
      print('url link');
      print(ApiUrl.myAds);
      var response = await client.get(Uri.parse(ApiUrl.myAds),
          headers: {"Authorization": "Bearer ${MyPref.token}"});
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

  static Future authorOrders({int? userId, int? page}) async {
    try {
      print('url link');
      print('http://izle.uz/api/ads/index?' + '$userId' + '&page=' + '$page');
      var response = await client.get(Uri.parse(
          'http://izle.uz/api/ads/index?' + '$userId' + '&page=' + '$page'));

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
  // static Future authorOrders(String authorToken) async {
  //   try {
  //     print('url link');
  //     print(ApiUrl.myAds);
  //     var response = await client.get(Uri.parse(ApiUrl.myAds),
  //         headers: {"Authorization": "Bearer $authorToken"});
  //     if (response.statusCode == 200) {
  //       var body = AdvertisementListModel.fromJson(json.decode(response.body));
  //       // print(response.body);
  //       print('this is author orders');
  //       return body;
  //     }
  //   } catch (e) {
  //     print('error in myorders service');
  //   }
  // }

  static Future editProfile(
      {required String name, required String email}) async {
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();

    try {
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      }, body: {
        'email': email,
        'name': name,
      });
      print(response.statusCode);
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

  static Future search({String? search, int? page}) async {
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

  static Future searchComplex(
      {String? search,
      int? page,
      required String catId,
      String? cityId}) async {
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
        headers: {"Authorization": "Bearer ${MyPref.token}"},
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
        headers: {"Authorization": "Bearer ${MyPref.token}"},
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
          headers: {"Authorization": "Bearer ${MyPref.token}"});
      if (response.statusCode == 200) {
        // print('success in adding favorites');
        // print(response.body);
      } else {
        print('error in else statement');
        print(MyPref.token);
        print(response.statusCode);
        print(ApiUrl.addAndDeleteFavorite + '$id');
      }
    } catch (e) {
      print('error in favorite service');
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

      print(response.body);
      print('hereeeee' + '${response.statusCode}');
      g.Get.dialog(
        Scaffold(
          backgroundColor: Colors.black.withOpacity(.1),
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              width: double.infinity,
              height: 100.0,
              child: Row(
                children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Подождите пожалуйста'),
                ],
              ),
            ),
          ),
        ),
      );
      // g.Get.back();
      if (response.statusCode == 200) {
        var body = LoginModel.fromJson(json.decode(response.body));
        print('login successfully');
        print('tokeeeeeeen');
        print(body.token);
        print(response.body);
        MyPref.token = body.token!;
        MyPref.phoneNumber = body.phone!;
        MyPref.userName = body.name!;
        MyPref.userId = '${body.id}';

        print('token in login');
        print(MyPref.token);
        await userInfoController.fetchUserInfo(userToken: MyPref.token);
        pageNavigationController.pageControllerChanger(4);
        pageNavigationController.tabIndexChanger(4);

        g.Get.offAll(
          () => NavScreen(),
        );
      } else if (response.statusCode == 422) {
        g.Get.back();

        return g.Get.dialog(
          GestureDetector(
            onTap: () {
              g.Get.back();
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
                        'Не верный логин и/или пароль',
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
      print(e);
      print('error in login service');
    }
  }

  static Future userInfo({String? userToken}) async {
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.myProfile),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $userToken',
        },
      );
      print('this is userInfo Service' + '${response.statusCode}');
      if (response.statusCode == 200) {
        // print(response.body);
        // print('this is userInfo service');
        var body = UserInfoModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in edit profile service');
      print(e);
    }
  }

  static Future logout() async {
    try {
      var response = await client.get(Uri.parse(ApiUrl.logout),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('successfully logout');

        await MyPref.clearAllll();
        await g.Get.offAll(() => NavScreen());
        pageNavigationController.pageControllerChanger(0);
        pageNavigationController.tabIndexChanger(0);
      }
    } catch (e) {
      print('error in logout service');
    }
  }

  static Future allPrice() async {
    try {
      var response = await client.get(Uri.parse(ApiUrl.listOfPrice));
      if (response.statusCode == 200) {
        var body = ListOfPricesModel.fromJson(json.decode(response.body));
        print(body);
        return body;
      }
    } catch (e) {
      print('error in allPrice service');
    }
  }

  static Future pay({required int id, required String type}) async {
    try {
      var response = await client.post(Uri.parse(ApiUrl.payPost), headers: {
        "Authorization": "Bearer ${MyPref.token}",
      }, body: {
        'id': '${id}',
        'type': type,
      });
      if (response.statusCode == 200) {
        var body = PayModel.fromJson(json.decode(response.body));
        MyPref.paymentLink = body.data!.link!;
        print(MyPref.paymentLink);
        return body;
      }
    } catch (e) {
      print(e);
      print('error in pay service');
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
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
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
        var body = RecoveryPasswordModel.fromJson(json.decode(response.body));
        print(body.data?.code);

        MyPref.code = '${body.data?.code}';

        print('success in sending phone to recovry');
        return body;
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
        var body = RecoveryPasswordModel2.fromJson(json.decode(response.body));
        print(response.body);

        print('success in sending phone to code to recory');
        return body;
      } else if (response.statusCode == 422) {
        // g.Get.back();

        return g.Get.dialog(
          GestureDetector(
            onTap: () {
              g.Get.back();
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
                        'Код указан неверно ',
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
      print('error in recovry passwrod sending code to recovery');
      print(e);
    }
  }
}
