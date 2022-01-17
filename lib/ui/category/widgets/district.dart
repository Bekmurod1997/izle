import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/fitler_detal_controller.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/ui/category/result_ads.dart';
import 'package:izle/utils/my_prefs.dart';

class DistrictScreen extends StatefulWidget {
  final int mainCategoryId;
  final int mainCatId;
  final String mainCategoryName;
  final String mainCityName;
  final int mainCityId;
  final List<Childs> districts;
  DistrictScreen(
      {required this.districts,
      required this.mainCategoryName,
      required this.mainCategoryId,
      required this.mainCatId,
      required this.mainCityId,
      required this.mainCityName});
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  final FilterDetalController filterDetalController =
      Get.find<FilterDetalController>();
  List<Childs> districts = [];
  @override
  void initState() {
    districts = widget.districts;
    super.initState();
  }

  // final recieveData =Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Card(
            child: ListTile(
                title: Text('Весь ' + widget.mainCityName),
                onTap: () {
                  filterDetalController.changerCityName(
                      cityNamee: widget.mainCityName);

                  Get.back();
                  Get.back();
                  filterDetalController.cityId.value = widget.mainCityId;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultAds(
                                mainCategoryId: widget.mainCategoryId,
                                catId: widget.mainCatId,
                                catName: widget.mainCategoryName,
                                cityId: widget.mainCityId.toString(),
                                cityName:
                                    filterDetalController.cityName.toString(),
                              )));
                }),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 4,
              ),
              padding: EdgeInsets.zero,
              itemCount: districts.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 0.4,
                ))),
                child: ListTile(
                    trailing:
                        Icon(Icons.arrow_forward, color: ColorPalate.mainColor),
                    title: Text(MyPref.lang == 'kr'
                        ? districts[index].nameEn!
                        : MyPref.lang == 'uz'
                            ? districts[index].nameUz!
                            : districts[index].nameRu!),
                    onTap: () {
                      Get.back();
                      Get.back();
                      filterDetalController.cityName.value =
                          widget.mainCityName;
                      filterDetalController.districtName.value =
                          MyPref.lang == 'kr'
                              ? districts[index].nameEn!
                              : MyPref.lang == 'uz'
                                  ? districts[index].nameUz!
                                  : districts[index].nameRu!;
                      filterDetalController.cityId.value = districts[index].id!;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ResultAds(
                                    mainCategoryId: widget.mainCategoryId,
                                    catId: widget.mainCatId,
                                    catName: widget.mainCategoryName,
                                    cityId: districts[index].id.toString(),
                                    cityName: filterDetalController.cityName
                                        .toString(),
                                  )));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
