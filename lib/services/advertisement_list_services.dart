import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/fitler_detal_controller.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';
import 'package:get/get.dart';

class AdvertisementListService {
  final FilterDetalController filterDetalController =
      Get.find<FilterDetalController>();
  static var client = http.Client();

  static Future fetchSubCategoryProducts({
    required String catId,
    required int page,
    String? searchWord,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? currencySort,
  }) async {
    print(Uri.parse(ApiUrl.subCategory +
        catId +
        '&page=$page' +
        '&price_finish=${priceFinish ?? ""}' +
        '&price_start=${priceStart ?? ""}' +
        '&price_sort=${priceSort ?? ""}' +
        '&search=${searchWord ?? ""}' +
        '&currency_sort=${currencySort ?? ""}' +
        '&city_id=${cityId ?? ""}'));
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.subCategory +
            catId +
            '&page=$page' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&search=${searchWord ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is arvertismentlist service');
        return body;
      }
    } catch (e) {
      print('error in AdvertisementListService');
      print(e);
    }
  }

  static Future fetchSubCategoryTopProducts({
    required String catId,
    required int page,
    String? searchWord,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? currencySort,
  }) async {
    print(Uri.parse(ApiUrl.subCategory +
        catId +
        '&page=$page' +
        '&type=top' +
        '&price_finish=${priceFinish ?? ""}' +
        '&price_start=${priceStart ?? ""}' +
        '&price_sort=${priceSort ?? ""}' +
        '&search=${searchWord ?? ""}' +
        '&currency_sort=${currencySort ?? ""}' +
        '&city_id=${cityId ?? ""}'));
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.subCategory +
            catId +
            '&page=$page' +
            '&type=top' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&search=${searchWord ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is arvertismentlist service');
        return body;
      }
    } catch (e) {
      print('error in AdvertisementListService');
      print(e);
    }
  }

  static Future fetchSubCategoryPremiumProducts({
    required String catId,
    required int page,
    String? searchWord,
    String? cityId,
    String? priceStart,
    String? priceFinish,
    String? priceSort,
    String? currencySort,
  }) async {
    print(Uri.parse(ApiUrl.subCategory +
        catId +
        '&page=$page' +
        '&type=premium' +
        '&price_finish=${priceFinish ?? ""}' +
        '&price_start=${priceStart ?? ""}' +
        '&price_sort=${priceSort ?? ""}' +
        '&search=${searchWord ?? ""}' +
        '&currency_sort=${currencySort ?? ""}' +
        '&city_id=${cityId ?? ""}'));
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.subCategory +
            catId +
            '&page=$page' +
            '&type=premium' +
            '&price_finish=${priceFinish ?? ""}' +
            '&price_start=${priceStart ?? ""}' +
            '&price_sort=${priceSort ?? ""}' +
            '&search=${searchWord ?? ""}' +
            '&currency_sort=${currencySort ?? ""}' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is arvertismentlist service');
        return body;
      }
    } catch (e) {
      print('error in AdvertisementListService');
      print(e);
    }
  }
}
