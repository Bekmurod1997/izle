import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/models/advertisement/advertisement_list_model.dart';

class AdvertisementListService {
  static var client = http.Client();

  static Future fetchSubCategoryProducts({
    required String catId,
    required int page,
    int? cityId,
  }) async {
    print(
      Uri.parse(ApiUrl.subCategory +
          catId +
          '&page=$page' +
          '&city_id=${cityId ?? ""}'),
    );
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.subCategory +
            catId +
            '&page=$page' +
            '&city_id=${cityId ?? ""}'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is arvertismentlist service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }

  static Future fetchSubCategoryProductsWithCity(
      {required String catId, required int cityId}) async {
    print(
      Uri.parse(ApiUrl.subCategory + catId + '&city_id=$cityId'),
    );
    try {
      var response = await client.get(
        Uri.parse(ApiUrl.subCategory + catId + '&city_id=$cityId'),
      );
      if (response.statusCode == 200) {
        var body = AdvertisementListModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('this is arvertismentlist service');
        return body;
      }
    } catch (e) {
      print('error in auth');
    }
  }
}
