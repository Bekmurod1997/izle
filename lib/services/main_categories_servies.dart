import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'dart:convert';

import 'package:izle/models/categories/main_categories_model.dart';

class MainCategoriesService {
  static var client = http.Client();

  static Future fetchMainCategories() async {
    try {
      var response = await client.post(Uri.parse(ApiUrl.mainCategories));
      if (response.statusCode == 200) {
        var body = MainCategoriesModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('mainCategories service');
        return body;
      } else {
        print('error in all products services');
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Request failed with error: $e.');
    }
  }
}
