// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

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
import 'package:izle/models/all_categories_model.dart';
import 'package:izle/models/all_message_model.dart';
import 'package:izle/models/all_transaction_model.dart';
import 'package:izle/models/complain_model.dart';
import 'package:izle/models/filter_model.dart';
import 'package:izle/models/list_of_price_model.dart';
import 'package:izle/models/list_of_tarrifs_model.dart';
import 'package:izle/models/login_model.dart';
import 'package:izle/models/pay_model.dart';
import 'package:izle/models/product_detail_model.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/models/re_password_model.dart';
import 'package:izle/models/recovery_password_model.dart';
import 'package:izle/models/single_message_model.dart';
import 'package:izle/models/unread_message_model.dart';
import 'package:izle/models/user_info_model.dart';
import 'package:izle/ui/auth/login/widgets/confirm_to_recovery.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:get/get.dart' as g;
import 'package:izle/models/all_regions_model.dart';

class AllServices {
  static PageNavigationController pageNavigationController =
      g.Get.find<PageNavigationController>();

  static var client = http.Client();
  String pN = '9';

  static Future allMessages(String? messageType) async {
    print('url link');
    print(ApiUrl.allChat + '${messageType ?? ""}');
    try {
      var response = await client.get(
          Uri.parse(ApiUrl.allChat + '$messageType'),
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

  static Future unreadMessages() async {
    print('url link');
    print(ApiUrl.unreadMessage);
    try {
      var response = await client.get(Uri.parse(ApiUrl.unreadMessage),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
      if (response.statusCode == 200) {
        var body = UnreadMessageModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in unreadchat service');
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

  static Future blockUser(String id, int status) async {
    print(ApiUrl.blockUser);
    try {
      var response = await client.post(Uri.parse(ApiUrl.blockUser),
          body: {'id': id},
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});

      if (response.statusCode == 200) {
        g.Get.snackbar(
          '',
          status == 0
              ? 'Пользователь заблокирован'
              : 'Пользователь разблокирован',
          backgroundColor: ColorPalate.lightGreen,
        );
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('Пользователь заблокирован')));
      } else {
        print('error in blocking');
        print(response.statusCode);
      }
    } catch (e) {
      print('error in blocking user block');
      print(e);
      print('error in blocking user block');
    }
  }

  static Future messageSetImportant(String id, int status) async {
    print(ApiUrl.setImportant);
    try {
      var response = await client.post(Uri.parse(ApiUrl.setImportant),
          body: {'id': id},
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});

      if (response.statusCode == 200) {
        g.Get.snackbar(
          '',
          status == 0 ? 'Добавлено в важные' : "Снять отметку как важный",
          backgroundColor: ColorPalate.lightGreen,
        );
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('Добавлено в важные')));
      } else {
        print('error in blocking');
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print('error in blocking user');
    }
  }

  static Future deleteMessage(
    String id,
  ) async {
    print(ApiUrl.deleteMessage);
    try {
      var response = await client.post(Uri.parse(ApiUrl.deleteMessage),
          body: {'id': id},
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});

      if (response.statusCode == 200) {
        g.Get.snackbar(
          '',
          'Чат удален',
          backgroundColor: ColorPalate.lightGreen,
        );
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('Чат удален')));
        g.Get.offAll(() => MessageScreen(''));
        pageNavigationController.pageControllerChanger(3);
        pageNavigationController.tabIndexChanger(3);
      } else {
        print('error in blocking');
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print('error in blocking user');
    }
  }

  static Future messageArchive(String id, int status) async {
    print(ApiUrl.setArchive);
    try {
      var response = await client.post(Uri.parse(ApiUrl.setArchive),
          body: {'id': id},
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});

      if (response.statusCode == 200) {
        g.Get.snackbar(
          '',
          status == 0
              ? 'Сообщение было заархивировано'
              : 'Сообщение было разархивировано',
          backgroundColor: ColorPalate.lightGreen,
        );
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('Added to archive')));
      } else {
        print('error in archiving');
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print('error in archiving user');
    }
  }

  static Future fetchPaymeTransaction() async {
    try {
      var response = await client.get(
          Uri.parse('http://izle.uz/api/payment/transactions?type=payme'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
      if (response.statusCode == 200) {
        var body = AllTransactionsModel.fromJson(json.decode(response.body));
        print('success in payme transaction');
        return body;
      } else {
        print('else statement in fetchPayme');
        print(response.statusCode);
      }
    } catch (e) {
      print('error in fetchPame');
      print(e);
    }
  }

  static Future fetchClickTransaction() async {
    try {
      var response = await client.get(
          Uri.parse('http://izle.uz/api/payment/transactions?type=click'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'});
      if (response.statusCode == 200) {
        var body = AllTransactionsModel.fromJson(json.decode(response.body));
        print('success in click transaction');
        return body;
      } else {
        print('else statement in fetchClick');
        print(response.statusCode);
      }
    } catch (e) {
      print('error in click');
      print(e);
    }
  }

  static Future allCategories() async {
    print('url link');
    print(ApiUrl.allCategories);
    try {
      var response = await client.get(Uri.parse(ApiUrl.mainCategories));
      if (response.statusCode == 200) {
        var body = AllCategoriesModel.fromJson(json.decode(response.body));
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

  static Future sendMessageFile(
      {required String getterId, required String fileName}) async {
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'getter_id': getterId,
    });
    formData.files.addAll([
      MapEntry(
          'file',
          await MultipartFile.fromFile(fileName,
              filename: fileName.split('/').last))
    ]);
    try {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    g.Obx(
                      () => Text(
                        'Отправляем ваши фото ' +
                            creatingAddInfoController
                                .messageUploadingPercentage.value
                                .toString() +
                            '%',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    g.Obx(() => LinearProgressIndicator(
                          value: creatingAddInfoController
                              .messageUploadingPercentage.value
                              .toDouble(),
                        )),
                    SizedBox(height: 30),
                  ],
                )),
          ),
        ),
      );

      var response = await dio.post(ApiUrl.sendMessage,
          data: formData,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
            "Authorization": "Bearer ${MyPref.token}"
          }), onSendProgress: (int sent, int total) {
        creatingAddInfoController.messageSendMegabay.value = sent / 1000000;
        creatingAddInfoController.messageTotalMegabayt.value = total / 1000000;
        creatingAddInfoController.messageUploadingPercentageChanger2(
            (creatingAddInfoController.messageSendMegabay.value /
                    creatingAddInfoController.messageTotalMegabayt.value *
                    100)
                .round());
      });

      if (response.statusCode == 200) {
        print('success in sending file in message');
      } else {
        print('this is else statment');
        print(response.statusCode);
      }
    } catch (e) {
      print('error in sending file');
      print(e);
    }
    // if()
  }

  static Future sendMessageFileFirstTime(
      {required String getterId, required String fileName}) async {
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'getter_id': getterId,
    });
    formData.files.addAll([
      MapEntry(
          'file',
          await MultipartFile.fromFile(fileName,
              filename: fileName.split('/').last))
    ]);
    try {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    g.Obx(
                      () => Text(
                        'Отправляем ваши фото ' +
                            creatingAddInfoController
                                .messageUploadingPercentage.value
                                .toString() +
                            '%',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    g.Obx(() => LinearProgressIndicator(
                          value: creatingAddInfoController
                              .messageUploadingPercentage.value
                              .toDouble(),
                        )),
                    SizedBox(height: 30),
                  ],
                )),
          ),
        ),
      );

      var response = await dio.post(ApiUrl.sendMessage,
          data: formData,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
            "Authorization": "Bearer ${MyPref.token}"
          }), onSendProgress: (int sent, int total) {
        creatingAddInfoController.messageSendMegabay.value = sent / 1000000;
        creatingAddInfoController.messageTotalMegabayt.value = total / 1000000;
        creatingAddInfoController.messageUploadingPercentageChanger(
            (creatingAddInfoController.messageSendMegabay.value /
                    creatingAddInfoController.messageTotalMegabayt.value *
                    100)
                .round());
      });

      if (response.statusCode == 200) {
        print('success in sending file in message');
      } else {
        print('this is else statment');
        print(response.statusCode);
      }
    } catch (e) {
      print('error in sending file');
      print(e);
    }
    // if()
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
      print('error in listofAllADs');
      print(e);
    }
  }

  static Future<AdvertisementListModel?> listOfAllPremiumAds(int page) async {
    print('url link');
    print(ApiUrl.listOfAllAds + '$page' + '&type=premium');
    try {
      var response = await client.get(
          Uri.parse(
            ApiUrl.listOfAllAds + '$page' + '&type=premium',
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
      print('error in listofAllADs');
      print(e);
    }
  }

  static Future<AdvertisementListModel?> listOfAllTopAds(int page) async {
    print('url link');
    print(ApiUrl.listOfAllAds + '$page' + '&type=top');
    try {
      var response = await client.get(
          Uri.parse(
            ApiUrl.listOfAllAds + '$page' + '&type=top',
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
      print('error in listofAllADs');
      print(e);
    }
  }

  static Future removeResum() async {
    var response = await client.post(Uri.parse(ApiUrl.resumeRemove),
        headers: {"Authorization": "Bearer ${MyPref.token}"});
    if (response.statusCode == 200) {
      print('successfully deleted');
    } else {
      print(response.statusCode);
      print('error in deleting cv');
    }
  }

  static Future sendResume() async {
    print('resume upload url');
    print(ApiUrl.resumeUpload);

    Dio dio = Dio();
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(userInfoController.resume.value,
          filename: userInfoController.resume.value.split('/').last)
    });
    var response = await dio.post(
      ApiUrl.resumeUpload,
      data: formData,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
        "Authorization": "Bearer ${MyPref.token}"
      }),
    );
    if (response.statusCode == 200) {
      print('successfully uploaded resume');
      // g.Get.dialog(
      //   Scaffold(
      //     backgroundColor: Colors.black.withOpacity(.1),
      //     body: Center(
      //       child: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20.0),
      //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //         color: Colors.white,
      //         width: double.infinity,
      //         height: 100.0,
      //         child: Row(
      //           children: [
      //             Text('Uploaded success'),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // );
    } else {
      print(response.statusCode);
      print('error in upload resume');
    }
  }

  static Future createAd(BuildContext context) async {
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
    print('my sending city id');
    print(creatingAddInfoController.cityId.value);

    print('my sending city name');
    print(creatingAddInfoController.cityName.value);
    Map<int, dynamic> myFilterData = creatingAddInfoController.myFileter;

    FormData formData = FormData.fromMap({
      'title': '${creatingAddInfoController.title.value}',
      'category_id': '${creatingAddInfoController.subCategoryId.value}',
      'price': '${creatingAddInfoController.price.value}',
      'price_d': '2799',
      'content': '${creatingAddInfoController.description.value}',
      'city_id': '${creatingAddInfoController.cityId.value}',
      'city_name': '${creatingAddInfoController.cityName.value}',
      'phone': '${creatingAddInfoController.phoneNumber.value}',
      'email': 'a@mail.ru',
      'type': '1',
      'address': '${creatingAddInfoController.cityName.value}',
      'responsible_person': 'Дмитрий Мухамадиев',
      'lat': '37.4219481',
      'lng': '-122.0835072',
      'name': '${MyPref.userName}',
      'type_ad': '${creatingAddInfoController.type_ad.value}',
    });
    if (myFilterData.isNotEmpty) {
      myFilterData.forEach((key, value) {
        print('showing my map values');
        formData.fields.addAll({MapEntry('filter[$key]', value)});
      });
    }

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

    try {
      creatingAddInfoController.images.length == 0 ||
              creatingAddInfoController.images.isEmpty
          ? print('empty images')
          : g.Get.dialog(
              Scaffold(
                backgroundColor: Colors.black.withOpacity(.1),
                body: Center(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: Colors.white,
                      width: double.infinity,
                      height: 100.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          g.Obx(
                            () => Text(
                              'Загрузка ваших фото ' +
                                  creatingAddInfoController
                                      .uploadingPercentage.value
                                      .toString() +
                                  '%',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          g.Obx(() => LinearProgressIndicator(
                                value: creatingAddInfoController
                                    .uploadingPercentage.value
                                    .toDouble(),
                              )),
                          SizedBox(height: 30),
                        ],
                      )),
                ),
              ),
            );
      if (creatingAddInfoController.images.length == 0 ||
          creatingAddInfoController.images.isEmpty) {
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
          print('succes in creating ads');

          print('success in creating ads');
          creatingAddInfoController.allClear();
          creatingAddInfoController.resetAll();
          g.Get.offAll(() => NavScreen());
          pageNavigationController.pageControllerChanger(4);
          pageNavigationController.tabIndexChanger(4);
        }
      } else {
        var response = await dio.post(ApiUrl.createAds,
            data: formData,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
              "Authorization": "Bearer ${MyPref.token}"
            }), onSendProgress: (int sent, int total) {
          creatingAddInfoController.sendMegabay.value = sent / 1000000;
          creatingAddInfoController.totalMegabayt.value = total / 1000000;
          creatingAddInfoController.totalUploadChanger(
              (creatingAddInfoController.sendMegabay.value /
                      creatingAddInfoController.totalMegabayt.value *
                      100)
                  .round());

          var senMeg = sent / 1000000;
          var totalMeg = total / 1000000;

          print('in controleer perce ');
          print(creatingAddInfoController.uploadingPercentage.value);
        });
        print(response.data);
        print(response.statusCode);
        if (response.statusCode == 200) {
          print('succes in creating ads');

          print('success in creating ads');
          creatingAddInfoController.allClear();
          creatingAddInfoController.resetAll();
        }
      }
    } catch (e) {
      print('error in creating adds');
      print(e);
    }
  }

  static Future editAd2(
      {required BuildContext context, required int id}) async {
    print('Edotimg add url');
    print(ApiUrl.editAds + '$id');
    Dio dio = Dio();
    final CreatingAddInfoController creatingAddInfoController =
        g.Get.find<CreatingAddInfoController>();
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();
    // try {
    // for(var i= 1; i<creatingAddInfoController.images.length; i++ ){

    //   }
    FormData formData = FormData.fromMap({
      'title': '${creatingAddInfoController.title.value}',
      'category_id': '${creatingAddInfoController.subCategoryId.value}',
      'price': creatingAddInfoController.type_ad.value == 'price'
          ? '${creatingAddInfoController.price.value}'
          : '0',
      'price_d': '2799',
      'content': '${creatingAddInfoController.description.value}',
      'city_id': '${creatingAddInfoController.cityId.value}',
      'city_name': '${creatingAddInfoController.cityName.value}',
      'phone': '${creatingAddInfoController.phoneNumber.value}',
      'email': 'a@mail.ru',
      'type': '1',
      'address': '${creatingAddInfoController.cityName.value}',
      'responsible_person': 'Дмитрий Мухамадиев',
      'lat': '37.4219481',
      'lng': '-122.0835072',
      'name': '${MyPref.userName}',
      'type_ad': '${creatingAddInfoController.type_ad.value}',
    });

    List photos = creatingAddInfoController.images;
    print('ssdid');
    print(photos);
    for (var i = 0; i < photos.length; i++) {
      var fileName = photos[i];
      if (!photos[i].toString().endsWith("jpg") &&
          !photos[i].toString().endsWith("png")) {
        Uint8List bytes = base64.decode(photos[i]);
        formData.files.add(MapEntry('gallery[${i - 1}]',
            await MultipartFile.fromBytes(bytes, filename: "file.jpg")));
        continue;
      } else
        formData.files.addAll([
          MapEntry(
              'gallery[${i - 1}]',
              await MultipartFile.fromFile(fileName,
                  filename: fileName.split('/').last)),
        ]);
    }

    try {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    g.Obx(
                      () => Text(
                        'Загрузка ваших фото ' +
                            creatingAddInfoController.uploadingPercentage.value
                                .toString() +
                            '%',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    g.Obx(() => LinearProgressIndicator(
                          value: creatingAddInfoController
                              .uploadingPercentage.value
                              .toDouble(),
                        )),
                    SizedBox(height: 30),
                  ],
                )),
          ),
        ),
      );

      var response = await dio.post(ApiUrl.editAds + '$id',
          data: formData,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
            "Authorization": "Bearer ${MyPref.token}"
          }), onSendProgress: (int sent, int total) {
        creatingAddInfoController.sendMegabay.value = sent / 1000000;
        creatingAddInfoController.totalMegabayt.value = total / 1000000;
        creatingAddInfoController.totalUploadChanger(
            (creatingAddInfoController.sendMegabay.value /
                    creatingAddInfoController.totalMegabayt.value *
                    100)
                .round());

        var senMeg = sent / 1000000;
        var totalMeg = total / 1000000;
        // print('sent $senMeg');
        // print('total $totalMeg');
        // var percentage = senMeg / totalMeg * 100;
        // print('$percentage');

        print('in controleer perce ');
        print(creatingAddInfoController.uploadingPercentage.value);
      });
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('succes in editing ads');
        g.Get.back();
        print('success in editing ads');
        creatingAddInfoController.allClear();
        creatingAddInfoController.resetAll();
        // print(response.body);
        // g.Get.to(() => ActiveProfileScreen());
        // pageNavigationController.pageControllerChanger(4);
        // pageNavigationController.tabIndexChanger(4);
        // g.Get.offAll(
        //   () => NavScreen(),
        // );
      }
    } catch (e) {
      print('error in eding  adds');
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
    Dio dio = Dio();
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

  static Future listOfTariffs() async {
    try {
      var response =
          await client.get(Uri.parse(ApiUrl.listOfTariffs), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}',
      });
      if (response.statusCode == 200) {
        var body = ListOfTarrifsModel.fromJson(json.decode(response.body));
        print(response.body);
        return body;
      }
    } catch (e) {
      print('error in listoftarrifs');
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

  static Future myActiveOrders() async {
    try {
      print('url link');
      print(ApiUrl.myAds + '?status=1');
      var response = await client.get(Uri.parse(ApiUrl.myAds + '?status=1'),
          headers: {"Authorization": "Bearer ${MyPref.token}"});
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is my active orders');

        return body;
      }
    } catch (e) {
      print('error in myorders service');
    }
  }

  static Future myOnModerationOrders() async {
    try {
      print('url link');
      print(ApiUrl.myAds + '?status=0');
      var response = await client.get(Uri.parse(ApiUrl.myAds + '?status=0'),
          headers: {"Authorization": "Bearer ${MyPref.token}"});
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is my onModeration orders');

        return body;
      }
    } catch (e) {
      print('error in onModeration service');
    }
  }

  static Future myInActiveOrders() async {
    try {
      print('url link');
      print(ApiUrl.myAds + '?status=2');
      var response = await client.get(Uri.parse(ApiUrl.myAds + '?status=2'),
          headers: {"Authorization": "Bearer ${MyPref.token}"});
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is my inactive orders');

        return body;
      }
    } catch (e) {
      print('error in inactive service');
    }
  }

  static Future listOfComplains() async {
    try {
      var response = await client
          .get(Uri.parse('http://izle.uz/api/category?type=complain'));
      if (response.statusCode == 200) {
        print('success in list of complains');

        var body = ComplainModel.fromJson(json.decode(response.body));
        print(body);
        return body;
      }
    } catch (e) {
      print('error in list of complains');
      print(e);
    }
  }

  static Future buyTariff({required String id}) async {
    try {
      g.Get.dialog(
        Scaffold(
          backgroundColor: Colors.black.withOpacity(.1),
          body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white,
                width: double.infinity,
                height: 140.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text('Пожалуйста подождите',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    CircularProgressIndicator(
                      color: ColorPalate.mainColor,
                    ),
                    SizedBox(height: 30),
                  ],
                )),
          ),
        ),
      );
      var response = await client.post(Uri.parse(ApiUrl.buyTarif), headers: {
        "Authorization": "Bearer ${MyPref.token}"
      }, body: {
        'id': id,
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
        g.GetBar();
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30),
                      Text('Вы успешно купили пакет',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30),
                    ],
                  )),
            ),
          ),
        );
      }
    } catch (e) {
      print('error in buying tariff');
      print(e);
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    Text('Ошибка, у вас может не хватить денег',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 30),
                  ],
                )),
          ),
        ),
      );
    }
  }

  static Future sendComplain(
      {required String ads_id, required String complainId}) async {
    try {
      var response = await client.post(
        Uri.parse(
          'http://izle.uz/api/ads/complain',
        ),
        body: {
          'ads_id': ads_id,
          'complain_id[0]': complainId,
        },
        headers: {"Authorization": "Bearer ${MyPref.token}"},
      );
      if (response.statusCode == 200) {
        g.Get.dialog(
          Scaffold(
            backgroundColor: Colors.black.withOpacity(.1),
            body: GestureDetector(
              onTap: () => g.Get.back(),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.white,
                  width: double.infinity,
                  height: 100.0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('Жалоба успешно отправлена'),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (response.statusCode == 422) {
        g.Get.dialog(
          Scaffold(
            backgroundColor: Colors.black.withOpacity(.1),
            body: GestureDetector(
              onTap: () => g.Get.back(),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.white,
                  width: double.infinity,
                  height: 100.0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('Жалоба успешно отправлена'),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        print(response.statusCode);
        print('eslse statement');
      }
    } catch (e) {
      print('error in sending complatin');
      print(e);
    }
  }

  static Future filterService({required String id}) async {
    print('the url');
    print(Uri.parse(ApiUrl.filter + id));
    try {
      var response = await client.get(Uri.parse(ApiUrl.filter + id));
      if (response.statusCode == 200) {
        var body = FilterModel.fromJson(json.decode(response.body));
        print('this is filter service');
        print(body);
        return body;
      }
    } catch (e) {
      print('error in filterService');
      print(e);
    }
  }

  static Future authorOrders({int? userId, int? page}) async {
    try {
      print('url link');
      print('http://izle.uz/api/ads/index?' +
          'user_id$userId' +
          '&page=' +
          '$page');
      var response = await client.get(Uri.parse(
          'http://izle.uz/api/ads/index?' +
              'user_id=$userId' +
              '&page=' +
              '$page'));

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

  static Future editDeviceToke({required String deviceId}) async {
    try {
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      }, body: {
        'device_id': deviceId,
      });
      if (response.statusCode == 200) {
        print('device id is update');
      } else {
        print('this is else statemnt in editDevice');
      }
    } catch (e) {
      print('error in editDevice service');
    }
  }

  static Future editProfile(
      {required String name, required String password, String? email}) async {
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();

    try {
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random _rnd = Random();
      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      }, body: {
        'email': getRandomString(10) + '@mail.ru',
        'password': password,
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

  static Future editName({required String name}) async {
    final UserInfoController userInfoController =
        g.Get.find<UserInfoController>();

    try {
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random _rnd = Random();
      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      var response =
          await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
      }, body: {
        'email': getRandomString(10) + '@mail.ru',
        'name': name,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        MyPref.userName = name;
        await g.Get.offAll(() => NavScreen());
        pageNavigationController.pageControllerChanger(4);
        pageNavigationController.tabIndexChanger(4);
        print('success in update Name');
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
      print('error in editProfile Name service');
    }
  }

  static Future search({
    String? search,
    int? page,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('url link');
    print(
      ApiUrl.search +
          '$search' +
          '&page=' +
          '$page' +
          '&price_finish=${priceFinish ?? ""}' +
          '&price_start=${priceStart ?? ""}' +
          '&category_id=${categoryId ?? ""}' +
          '&price_sort=${priceSort ?? ""}' +
          '&currency_sort=${currencySort ?? ""}' +
          '&city_id=${cityId ?? ""}',
    );
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.search +
            '$search' +
            '&page=' +
            '$page' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&category_id=${categoryId ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is list of all search ads service');
        return body;
      }
    } catch (e) {
      print('error in search');
    }
  }

  static Future searchTop({
    String? search,
    int? page,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('url link');
    print(
      ApiUrl.search +
          '$search' +
          '&page=' +
          '$page' +
          '&type=top' +
          '&price_finish=${priceFinish ?? ""}' +
          '&price_start=${priceStart ?? ""}' +
          '&category_id=${categoryId ?? ""}' +
          '&price_sort=${priceSort ?? ""}' +
          '&currency_sort=${currencySort ?? ""}' +
          '&city_id=${cityId ?? ""}',
    );
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.search +
            '$search' +
            '&page=' +
            '$page' +
            '&type=top' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&category_id=${categoryId ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is list of all search ads service');
        return body;
      }
    } catch (e) {
      print('error in search');
    }
  }

  static Future searchPremium({
    String? search,
    int? page,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? categoryId,
    String? currencySort,
  }) async {
    print('url link');
    print(
      ApiUrl.search +
          '$search' +
          '&page=' +
          '$page' +
          '&type=premium' +
          '&price_finish=${priceFinish ?? ""}' +
          '&price_start=${priceStart ?? ""}' +
          '&category_id=${categoryId ?? ""}' +
          '&price_sort=${priceSort ?? ""}' +
          '&currency_sort=${currencySort ?? ""}' +
          '&city_id=${cityId ?? ""}',
    );
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.search +
            '$search' +
            '&page=' +
            '$page' +
            '&type=premium' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&category_id=${categoryId ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        print(response.body);
        print('this is list of all search ads service');
        return body;
      }
    } catch (e) {
      print('error in search');
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
      print('error in search');
      print(e);
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
      print('error in favorite');
      print(e);
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
        MyPref.password = password;
        var body = LoginModel.fromJson(json.decode(response.body));
        print('login successfully');
        print('tokeeeeeeen');
        print(body.token);
        print(response.body);
        MyPref.token = body.token!;
        MyPref.email = body.email!;

        MyPref.phoneNumber = body.phone!;
        MyPref.userName = body.name!;
        MyPref.userId = '${body.id}';

        print('this is login fcmtoke');
        print(MyPref.fcmToken);

        print('token in login');
        print(MyPref.token);
        await userInfoController.fetchUserInfo(userToken: MyPref.token);
        try {
          var response2 =
              await client.post(Uri.parse(ApiUrl.updateProfile), headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'
          }, body: {
            'device_id': MyPref.fcmToken,
            'email': MyPref.email,
          });
          if (response2.statusCode == 200) {
            print('device id is update');
          } else {
            print('this is else statemnt in editDevice');
          }
        } catch (e) {
          print('error in editDevice service');
        }

        g.Get.back();
        await g.Get.offAll(
          () => NavScreen(),
        );

        // editDeviceToke(deviceId: body.deviceId!);

        pageNavigationController.pageControllerChanger(4);
        pageNavigationController.tabIndexChanger(4);
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

  static Future deactivateStatus({required String adId}) async {
    try {
      var response = await client.post(
        Uri.parse(ApiUrl.changeStatus),
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'},
        body: {
          'ads_id': adId,
          'status': '2',
        },
      );
      if (response.statusCode == 200) {
        print('success in deactivating ad');
      }
    } catch (e) {
      print('error in deactivate ad');
      print(e);
    }
  }

  static Future activateStatus({required String adId}) async {
    try {
      var response = await client.post(
        Uri.parse(ApiUrl.changeStatus),
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'},
        body: {
          'ads_id': adId,
          'status': '1',
        },
      );
      if (response.statusCode == 200) {
        print('success in deactivating ad');
      }
    } catch (e) {
      print('error in deactivate ad');
      print(e);
    }
  }

  static Future deleteAccount() async {
    try {
      var response = await client.post(
        Uri.parse(ApiUrl.removeUser),
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${MyPref.token}'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('successfully logout');

        await MyPref.clearAllll();
        await g.Get.offAll(() => NavScreen());
        pageNavigationController.pageControllerChanger(0);
        pageNavigationController.tabIndexChanger(0);
      }
    } catch (e) {
      print('error in deleting account service');
      print(e);
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

  static Future<ProductDetailModel?> productDetail(
      // String? currencyType,
      // int prodId

      {
    required int prodId,
    String? currencyType,
  }) async {
    try {
      var response = await client.get(Uri.parse(ApiUrl.productDetail +
          '$prodId' +
          '&currency_sort=${currencyType ?? ""}'));
      if (response.statusCode == 200) {
        print('my url');
        print(Uri.parse(ApiUrl.productDetail +
            '$prodId' +
            '&currency_sort=${currencyType ?? ""}'));
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
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = RecoveryPasswordModel.fromJson(json.decode(response.body));
        print(body.data?.code);
        g.Get.to(() => ConfirmToRecovery(phoneNumber: phoneNumber));

        MyPref.code = '${body.data?.code}';

        print('success in sending phone to recovry');
        return body;
      }
      if (response.statusCode == 404) {
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30),
                      Text('Номер телефона не найден',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30),
                    ],
                  )),
            ),
          ),
        );
      }
    } catch (e) {
      print('error in recovry passwrod sending phonenumber');
      print(e);
    }
  }

  static Future recoveryCodePassword(String phoneNumber, String code) async {
    print('phone number');
    print(phoneNumber);
    print('code');
    print(code);
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
