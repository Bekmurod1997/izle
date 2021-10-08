import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:izle/models/categories/main_categories_model.dart';

class SubCategoryService {
  static var client = http.Client();

  static Future fetchSubCategories(int? id) async {
    try {
      var response = await client
          .post(Uri.parse('http://izle.loko.uz/api/category/sub?id=$id'));
      if (response.statusCode == 200) {
        var body = MainCategoriesModel.fromJson(json.decode(response.body));
        // print(response.body);
        // print('subCategory service');
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
