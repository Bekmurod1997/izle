import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/filter_search_controller.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/ui/home/widgets/search_reasult.dart';

class EditSubRegionChoice extends StatefulWidget {
  final bool isDetailed;
  final String mainCityName;
  final int mainCityId;
  final List<Childs> districts;
  EditSubRegionChoice(
      {this.isDetailed = false,
      required this.districts,
      required this.mainCityId,
      required this.mainCityName});
  @override
  _EditSubRegionChoiceState createState() => _EditSubRegionChoiceState();
}

class _EditSubRegionChoiceState extends State<EditSubRegionChoice> {
  // final FilterDetalController filterDetalController =
  //     Get.find<FilterDetalController>();

  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
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
                    title: Text(districts[index].nameRu!),
                    onTap: () {
                      creatingAddInfoController.cityName.value =
                          widget.mainCityName;
                      creatingAddInfoController.cityId.value =
                          districts[index].id!.toString();
                      creatingAddInfoController.cityName.value =
                          districts[index].nameRu!;
                      print(creatingAddInfoController.cityId.value);
                      creatingAddInfoController.cityName.value =
                          districts[index].nameRu!;
                      print(creatingAddInfoController.cityName.value);
                      Get.back();
                      Get.back();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) => SearchResult(
                      //         cityId: creatingAddInfoController.cityId.value == 0
                      //             ? ""
                      //             : creatingAddInfoController.cityId.value
                      //                 .toString(),
                      //         catId: filterSearchController
                      //                     .subCategoryId.value ==
                      //                 0
                      //             ? filterSearchController.mainCategoryId.value
                      //                 .toString()
                      //             : filterSearchController.subCategoryId.value
                      //                 .toString(),
                      //         priceFinish: filterSearchController
                      //                 .price_finish.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.price_finish.value,
                      //         priceSort: filterSearchController
                      //                 .sortingType.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.sortingType.value,
                      //         priceStart: filterSearchController
                      //                 .price_start.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.price_start.value,
                      //       ),
                      //     ));

                      // filterDetalController.cityName.value =
                      //     widget.mainCityName;
                      // filterDetalController.districtName.value =
                      //     districts[index].nameRu!;
                      // filterDetalController.cityId.value = districts[index].id!;
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => ResultAds(
                      //               mainCategoryId: widget.mainCategoryId,
                      //               catId: widget.mainCatId,
                      //               catName: widget.mainCategoryName,
                      //               cityId: districts[index].id.toString(),
                      //               cityName: filterDetalController.cityName
                      //                   .toString(),
                      //             )));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
