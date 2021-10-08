import 'package:flutter/material.dart';
import 'package:izle/controller/all_cities_controller.dart';
import 'package:get/get.dart';

class AllCitiesScreen extends StatefulWidget {
  @override
  _AllCitiesScreenState createState() => _AllCitiesScreenState();
}

class _AllCitiesScreenState extends State<AllCitiesScreen> {
  final AllCityController allCityController = Get.find<AllCityController>();

  @override
  void initState() {
    allCityController.fetchMainCategries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
