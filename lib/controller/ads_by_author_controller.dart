import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/models/author_ads_model.dart';

class AdsByAuthorController extends GetxController {
  var isLoading = true.obs;
  var authorAdsList = AdsByAuthorModel().obs;
  var currentPage = 1;

  void fetchAllAdsByAuthor() async {
    print('fetching all ads by author in controller');
  }
}
